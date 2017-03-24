class Event < OpenStruct
  def self.find_events(user)
    GithubService.new(user).events.map do |event|
      Event.new(event)
    end
  end
end
