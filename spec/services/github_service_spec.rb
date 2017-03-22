require 'rails_helper'

describe '#starred repos' do
  it 'shows number of starred repositories' do
    user = User.create(
      uid: Figaro.env.github_client_id,
      username: "alfosco",
      token: ENV['TOKEN'],
    )
    stars = Starred.find_starred_repos(user)
    star  = stars.first

    expect(stars.count).to eq(2)
    expect(star[:name]).to eq('turing-rails_engine_api')
  end
end
