class Repository < OpenStruct
  def self.find_repositories(user)
    GithubService.new(user).my_repos.map do |repo|
      Repository.new(repo)
    end
  end

  def self.count(user)
    GithubService.new(user).my_repos.count
  end
end
