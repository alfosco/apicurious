class GithubService
  attr_reader :connection, :user

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com/users")
  end

  def client_id_and_secret
    "client_id=#{Figaro.env.github_client_id}&client_secret=#{Figaro.env.github_client_secret}"
  end

  def user_info
    parse(connection.get("#{user.username}?client_id_and_secret"))
  end

  def starred_repos
    parse(connection.get("#{user.username}/starred?client_id_and_secret"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
