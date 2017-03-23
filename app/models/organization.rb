class Organization < OpenStruct
  def self.find_organizations(user)
    GithubService.new(user).organizations.map do |organization|
      Organization.new(organization)
    end
  end

  def self.count(user)
    GithubService.new(user).organizations.count
  end
end
