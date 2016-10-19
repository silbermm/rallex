# Rallex

Library for interacting with [Rally](https://www.rallydev.com/)

Still very much a work in progress.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `rallex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:rallex, "~> 0.1.0"}]
    end
    ```

  2. Ensure `rallex` is started before your application:

    ```elixir
    def application do
      [applications: [:rallex]]
    end
    ```

## Usage

### Webhooks
Create a webhook.
  ```
  webhook = %Rallex.WebhookRequest{
    AppName: "My appname",
    AppUrl: "https://somepage.tomy.app.com",
    Name: "My Great Webhook",
    TargetUrl: "https://omepage.tomy.app.com/path",
    ObjectTypes: ["HierarchicalRequirement", "Defect"],
    Expressions: [ 
      %{
        :AttributeName => "PlanEstimate",
        :Operator =>  ">",
        :Value => "18"
      }
    ]
  }
  case Rallex.Webhooks.create(webhook, "your_api_key") do
    {:ok, %Rallex.WebhookResponse{} = response} -> #created
    {:error, reason} -> #failed
  end

  ```


### Queries


