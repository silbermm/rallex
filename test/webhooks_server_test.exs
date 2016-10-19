defmodule WebhookServerTest do
  use ExUnit.Case
  require Logger
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
    case Rallex.Webhooks.create(webhook, Application.get_env(:rallex, :rally_api_key, nil)) do
      {:ok, result} -> 
        IO.inspect result
        assert true
      {:error, reason} -> assert false
    end
  end

  @tag :integration
  test "delete a webhook" do
    case Rallex.Webhooks.delete("https://rally1.rallydev.com/notifications/api/v2/webhook/3d425685-ba4c-4c49-be17-cb79489ecd08",Application.get_env(:rallex, :rally_api_key, nil)) do
      {:ok, _} -> assert true
      {:error, reason} -> 
        Logger.debug reason
        assert false
    end
  end

  @tag :integration
  test "list webhooks" do
    case Rallex.Webhooks.list(Application.get_env(:rallex, :rally_api_key, nil)) do
      {:ok, %{"Results" => response}} -> 
        assert true
      {:error, _} -> assert false
    end
  end

  @tag :integration
  test "list webhooks with page size of 1" do
    case Rallex.Webhooks.list(1, 1, Application.get_env(:rallex, :rally_api_key, nil)) do
      {:ok, %{"Results" => response}} -> 
        assert Enum.count(response) == 1
        assert true
      {:error, _} -> assert false
    end
  end
end
