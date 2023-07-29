defmodule Likes.Likes do

  def subscribe() do
    Phoenix.PubSub.subscribe(Likes.PubSub, "likes_update")
  end

  def broadcast(message) do
    Phoenix.PubSub.broadcast(Likes.PubSub, "likes_update", message)
    # PubSub.broadcast(ReinforcementLearning.PubSub, "likes", message)
  end

end
