class GossipsController < ApplicationController
  def page
    id_ = params[:id]
    @gossip = Gossip.find(id_)
  end

  def user
    id_ = params[:id]
    @user = User.find(id_)
  end
end
