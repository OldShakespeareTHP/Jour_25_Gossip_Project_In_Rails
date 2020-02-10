class WelcomeController < ApplicationController
  def page
    @first_name = params[:first_name]
    @gossips = Gossip.all
  end
end
