require 'rails_helper'

describe "user views their starred repos" do
  scenario "they visit stars page" do
    VCR.use_cassette("features/starred") do

      current_user = User.create(uid: Figaro.env.github_client_id, username: "alfosco")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit "/stars"

      expect(page).to have_content("Starred Repositories")
      expect(page).to have_content("Repository Name: AELSchauer/turing-rails_engine_api")
      expect(page).to have_content("Repository Language: Ruby")
    end
  end
end
