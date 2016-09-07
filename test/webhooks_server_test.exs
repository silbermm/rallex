defmodule WebhookServerTest do
  use ExUnit.Case
  doctest Rallex.Webhooks

  @tag :integration
  test "creating a webhook" do
    webhook = %Rallex.WebhookRequest{
      AppName: "Testing Rallex",
      AppUrl: "https://github.com/silbermm/rallex",
      Name: "Testing Rallex",
      TargetUrl: "https://localhost:4000/path",
      ObjectTypes: ["HierarchicalRequirement", "Defect"],
      Expressions: [ 
        %{
          :AttributeName => "PlanEstimate",
          :Operator =>  ">",
          :Value => "18"
        }
      ]
    }
    
    result = Rallex.Webhooks.create(webhook, Application.get_env(:rallex, :rally_api_key, nil))
    assert result == :ok

  end
end
