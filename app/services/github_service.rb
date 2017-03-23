class GithubService
  attr_reader :connection, :user

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com/")
    @connection.headers[:Authorization] = "token #{@user['token']}"
  end

  def user_info
    parse(connection.get("users/#{user.username}"))
  end

  def starred_repos
    parse(connection.get("users/#{user.username}/starred"))
  end

  def followers
    parse(connection.get("users/#{user.username}/followers"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
