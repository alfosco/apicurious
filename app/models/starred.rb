class Starred
  # attr_reader :name, :owner
  #
  # def initialize(attributes={})
  #   @name = attributes[:name]
  #   @owner = attributes[:owner][:login]
  # end
  #
  def self.find_starred_repos(user)
    GithubService.new(user).starred_repos
  end

  def self.count(user)
    GithubService.new(user).starred_repos.count
  end
end
