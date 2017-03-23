class DashboardController < ApplicationController
  before_action :authorize!

  def index
    user = User.find(session[:user_id])
    @user_profile = User.find_user_info(user)
    @star_count = Starred.count(user)
    @follower_count = Follower.count(user)
  end
end
