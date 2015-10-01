require 'spec_helper'

feature 'Main Navigation' do

  scenario 'should highlight first level index', js: true do
    admin_login
    visit admin_releases_path

    expect(page.find('.current').text).to eq('Releases')
  end

  scenario 'should highlight first level new page', js: true do
    admin_login
    visit new_admin_release_path

    expect(page.find('.current').text).to eq('Releases')
  end

  scenario 'should highlight first level edit page', js: true do
    admin_login
    release = FactoryGirl.create(:release)
    visit edit_admin_release_path(release)

    expect(page.find('.current').text).to eq('Releases')
  end

  scenario 'should highlight second level index', js: true do
    super_admin_login
    visit fae.users_path

    expect(page.find('.current').text).to eq('Users')
  end

  scenario 'should highlight second level new page', js: true do
    super_admin_login
    visit fae.new_user_path

    expect(page.find('.current').text).to eq('Users')
  end

  scenario 'should highlight second level edit page', js: true do
    super_admin_login
    user = FactoryGirl.create(:fae_user)
    visit fae.edit_user_path(user)

    expect(page.find('.current').text).to eq('Users')
  end

  scenario 'should highlight third level index', js: true do
    admin_login
    team = FactoryGirl.create(:team)
    visit admin_team_coaches_path(team)

    expect(page.find('.current').text).to eq('Coaches')
  end

  scenario 'should highlight third level new page', js: true do
    admin_login
    team = FactoryGirl.create(:team)
    visit new_admin_team_coach_path(team)

    expect(page.find('.current').text).to eq('Coaches')
  end

  scenario 'should highlight third level edit page', js: true do
    admin_login
    coach = FactoryGirl.create(:coach)
    visit edit_admin_team_coach_path(coach.team, coach)

    expect(page.find('.current').text).to eq('Coaches')
  end

end
