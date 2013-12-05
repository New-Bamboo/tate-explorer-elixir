defmodule TateExplorer.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link({ :local, __MODULE__ }, __MODULE__, [])
  end

  def init([]) do
    tree = [ worker(TateExplorer.Dynamo, []), worker(TateExplorer.Repo, []), worker(TateExplorer.Cache, []) ]
    supervise(tree, strategy: :one_for_all)
  end
end
