class Following < OpenStruct
  def self.find_following(user)
    GithubService.new(user).following.map do |follow|
      Follower.new(follow)
    end
  end

  def self.count(user)
    GithubService.new(user).following.count
  end
end
