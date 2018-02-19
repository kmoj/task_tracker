defmodule TaskTracker.Job.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker.Job.Task


  schema "tasks" do
    field :assigned_to, :string
    field :complete, :boolean, default: false
    field :description, :string
    field :time, :integer, default: 0
    field :title, :string
    belongs_to :user, TaskTracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :assigned_to, :time, :complete, :user_id])
    |> validate_required([:title, :description, :assigned_to, :time, :complete, :user_id])
  end
end
