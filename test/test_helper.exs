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

defmodule TateExplorer.RepoTestCase do
  use ExUnit.CaseTemplate
  alias Ecto.Adapters.Postgres
  alias TateExplorer.Repo

  setup do
    :ok = Postgres.begin_test_transaction(Repo)
  end

  teardown do
    :ok = Postgres.rollback_test_transaction(Repo)
  end
end
