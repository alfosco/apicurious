class FollowersController < ApplicationController
  before_action :authorize!

  def index
    user = User.find(session[:user_id])
    @followers = Follower.find_followers(user)
    @star_count = Starred.count(user)
    @follower_count = Follower.count(user)
  end
end
