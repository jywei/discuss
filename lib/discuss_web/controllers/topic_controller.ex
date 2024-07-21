defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topics.Service
  alias Discuss.Topics.Topic

  def index(conn, _params) do
    topics = Service.list_topics()
    render(conn, :index, topics: topics)
  end

  def new(conn, _params) do
    changeset = Service.change_topic(%Topic{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"topic" => topic_params}) do
    case Service.create_topic(topic_params) do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic created successfully.")
        |> redirect(to: ~p"/topics/#{topic}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => topic_id}) do
    topic = Service.get_topic!(topic_id)
    render(conn, :show, topic: topic)
  end

  def edit(conn, %{"id" => topic_id}) do
    topic = Service.get_topic!(topic_id)
    changeset = Service.change_topic(topic)
    render(conn, :edit, topic: topic, changeset: changeset)
  end

  def update(conn, %{"id" => topic_id, "topic" => topic_params}) do
    topic = Service.get_topic!(topic_id)

    case Service.update_topic(topic, topic_params) do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic updated successfully.")
        |> redirect(to: ~p"/topics/#{topic}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, topic: topic, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    topic = Service.get_topic!(topic_id)
    {:ok, _topic} = Service.delete_topic(topic)

    conn
    |> put_flash(:info, "Topic deleted successfully.")
    |> redirect(to: ~p"/topics")
  end
end
