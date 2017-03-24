require 'rails_helper'

describe GithubService do
  attr_reader :service

  before(:each) do
    current_user = User.create(uid: Figaro.env.github_client_id, username: "alfosco")
    @service = GithubService.new(current_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  describe 'starred repos' do
    it 'returns starred repositories' do
      VCR.use_cassette("services/starred") do
        stars = @service.starred_repos
        star  = stars.first

        expect(stars.count).to eq(2)
        expect(star[:name]).to eq('turing-rails_engine_api')
      end
    end
  end

end
