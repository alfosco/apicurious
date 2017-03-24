class DashboardController < ApplicationController
  before_action :authorize!

  def index
    user = User.find(session[:user_id])
    @user_profile = User.find_user_info(user)
    @events = Event.find_events(user)
    @star_count = Starred.count(user)
    @follower_count = Follower.count(user)
    @following_count = Following.count(user)
    @organization_count = Organization.count(user)
    @repository_count = Repository.count(user)
  end
end
