Dynamo.under_test(TateExplorer.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule TateExplorer.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
