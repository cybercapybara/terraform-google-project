# terraform-google-project

Terraform module that manages a [Google Cloud](https://cloud.google.com/)
project (`google_project`). It creates a project under an organization or
folder, associates a billing account and enables a set of APIs.

## Usage

```hcl
module "project" {
  source = "github.com/cybercapybara/terraform-google-project"

  project_id      = "my-app-prod-1234"
  name            = "My App Prod"
  org_id          = "123456789012"
  billing_account = "0123AB-4567CD-89EF01"

  activate_apis = [
    "compute.googleapis.com",
    "run.googleapis.com",
  ]
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| google    | >= 5.0   |

## Inputs

| Name                  | Description                                              | Type           | Default | Required |
|-----------------------|----------------------------------------------------------|----------------|---------|:--------:|
| `project_id`          | Globally unique id of the project to create.             | `string`       | n/a     |   yes    |
| `name`                | Human-readable display name of the project.              | `string`       | n/a     |   yes    |
| `org_id`              | Numeric organization id.                                 | `string`       | `null`  |    no    |
| `folder_id`           | Numeric folder id.                                       | `string`       | `null`  |    no    |
| `billing_account`     | Billing account id to associate.                         | `string`       | `null`  |    no    |
| `auto_create_network` | Whether to create the default network.                   | `bool`         | `false` |    no    |
| `activate_apis`       | APIs to enable on the project.                           | `list(string)` | `[]`    |    no    |
| `labels`              | Labels applied to the project.                           | `map(string)`  | `{}`    |    no    |

## Outputs

| Name           | Description                        |
|----------------|------------------------------------|
| `id`           | Identifier of the project.        |
| `project_id`   | Id of the project.                |
| `number`       | Numeric identifier of the project.|
| `enabled_apis` | APIs enabled on the project.      |

## License

[MIT](LICENSE)
