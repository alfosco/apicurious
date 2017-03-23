class Starred < OpenStruct

  def self.find_starred_repos(user)
    GithubService.new(user).starred_repos.map do |starred_repo|
      Starred.new(starred_repo)
    end
  end

  def self.count(user)
    GithubService.new(user).starred_repos.count
  end
end
