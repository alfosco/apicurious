class ReceivedEvent < OpenStruct
  def self.find_received_events(user)
    GithubService.new(user).received_events.map do |event|
      ReceivedEvent.new(event)
    end
  end
end
