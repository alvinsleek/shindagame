defmodule MyApp.Queue do
  use GenServer

  # Initialize the GenServer
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  # API functions
  def add_task(priority, task) do
    GenServer.cast(__MODULE__, {:add_task, priority, task})
  end

  # GenServer callbacks
  def init(_) do
    {:ok, :queue.new()}
  end

  def handle_cast({:add_task, priority, task}, queue) do
    new_queue = :queue.in(priority, task, queue)
    {:noreply, new_queue}
  end

  # Function to dequeue and process tasks
  def dequeue_and_process() do
    GenServer.cast(__MODULE__, :dequeue_and_process)
  end

  def handle_cast(:dequeue_and_process, queue) do
    case :queue.out(queue) do
      {:value, {_priority, task}, new_queue} ->
        # Process the task (e.g., send email)
        # You can use Bamboo here to send email notifications

        # Continue processing next tasks
        {:noreply, new_queue}

      :empty ->
        # No tasks to process
        {:noreply, queue}
    end
  end
end
