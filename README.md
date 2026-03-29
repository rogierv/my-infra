# my-infra

Azure infrastructure managed with OpenTofu, deployed via GitHub Actions using OIDC authentication.

## Prerequisites

Before using this repository, complete the following one-time setup steps.

### 1. Create a service principal

```bash
az ad sp create-for-rbac --name github-deployer --role Owner --scopes /subscriptions/<subscription-id>
```

Note the `appId`, `tenantId`, and your `subscriptionId` — you'll need them in the next step.

> **Important:** The service principal requires the **User Access Administrator** role on the subscription, in addition to Contributor, because OpenTofu creates role assignments. `Owner` covers both, so use that if creating from scratch.

### 2. Configure OIDC federation

Allow GitHub Actions to authenticate as the service principal without a client secret.

```bash
az ad app federated-credential create \
  --id <app-id> \
  --parameters '{
    "name": "github-deployer-federation",
    "issuer": "https://token.actions.githubusercontent.com",
    "subject": "repo:<your-github-org>/<your-repo>:ref:refs/heads/main",
    "audiences": ["api://AzureADTokenExchange"]
  }'
```

### 3. Add GitHub Actions secrets

In your GitHub repository go to **Settings → Secrets and variables → Actions** and add:

| Secret | Value |
|---|---|
| `AZURE_CLIENT_ID` | `appId` from step 1 |
| `AZURE_TENANT_ID` | `tenantId` from step 1 |
| `AZURE_SUBSCRIPTION_ID` | Your Azure subscription ID |

### 4. Grant Groups Administrator in Entra ID

The service principal needs permission to create Azure AD groups.

1. Go to **portal.azure.com** → **Microsoft Entra ID**
2. In the left menu click **Roles and administrators**
3. Search for and click **Groups Administrator**
4. Click **Add assignments**, search for **github-deployer**, select it and click **Add**
