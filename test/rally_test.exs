defmodule RallyTest do
  use ExUnit.Case
  doctest Rallex.Rally

  test "return rally headers" do
    headers = Rallex.Rally.headers("some_api_key")
    assert headers == %{"ZSESSIONID" => "some_api_key"}
  end

  test "return rally cookie" do
    cookies = Rallex.Rally.cookie("some_api_key")
    assert cookies == [cookie: ["ZSESSIONID=some_api_key"]]
  end
end
