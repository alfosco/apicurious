class StarsController < ApplicationController
  before_action :authorize!

  def index
    user = User.find(session[:user_id])
    @starred = Starred.find_starred_repos(user)
    @star_count = Starred.count(user)
    @follower_count = Follower.count(user)
  end

end
