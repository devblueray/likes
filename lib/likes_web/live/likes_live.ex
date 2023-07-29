defmodule LikesWeb.LikesLive do

  use LikesWeb, :live_view
  alias Likes.Likes

  def mount(_,_,socket) do
    if connected?(socket) do
      IO.puts("connected")
      Likes.subscribe()
    end

    {:ok, assign(socket, likes: Likes.Queue.queue())}
  end

  def render(assigns) do
    ~H"""
      <button phx-click="like">
      Like
      </button>
      <p> Likes: <%= @likes %></p>
    """
  end


  def handle_event("like", _, socket) do
    socket = update(socket, :likes, &(&1+1))
    Likes.broadcast({:like_updates, socket.assigns.likes})
    {:noreply, socket}
  end

  def handle_info({:like_updates, likes}, socket) do
    {:noreply, assign(socket, :likes, likes)}
  end


end
