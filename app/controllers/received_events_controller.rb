class ReceivedEventsController < ApplicationController
  before_action :authorize!

  def index
    user = User.find(session[:user_id])
    @received_events = ReceivedEvent.find_received_events(user)
    @star_count = Starred.count(user)
    @follower_count = Follower.count(user)
    @following_count = Following.count(user)
    @organization_count = Organization.count(user)
    @repository_count = Repository.count(user)
  end
end
