require 'rails_helper'

describe 'starred repos' do
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

describe 'followers' do
  it 'shows who is following you' do
    user = User.create(
      uid: Figaro.env.github_client_id,
      username: "alfosco",
      token: ENV['TOKEN'],
    )
    followers = Follower.find_followers(user)
    follower = followers.first

    expect(followers.count).to eq(2)
    expect(follower[:login]).to eq('janderson16')
  end
end
