class Follower < OpenStruct
  def self.find_followers(user)
    GithubService.new(user).followers.map do |follower|
      Follower.new(follower)
    end
  end

  def self.count(user)
    GithubService.new(user).followers.count
  end
end
