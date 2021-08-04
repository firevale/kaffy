defmodule Kaffy2.Scheduler.Supervisor do
  use DynamicSupervisor

  def start_link(args) do
    result = DynamicSupervisor.start_link(__MODULE__, args, name: KaffyTaskSupervisor2)
    tasks = Kaffy2.Tasks.collect_tasks()

    for task <- tasks do
      DynamicSupervisor.start_child(KaffyTaskSupervisor, {Kaffy2.Scheduler.Task, task})
    end

    result
  end

  @impl true
  def init(_tasks) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end
