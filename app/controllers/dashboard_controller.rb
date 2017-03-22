class DashboardController < ApplicationController
  before_action :authorize!

  def index
    user = User.find(session[:user_id])
    @user_profile = User.user_info(user)
    @starred = Starred.count(user)
  end
end
