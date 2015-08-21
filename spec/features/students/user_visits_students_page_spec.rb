require 'spec_helper'

feature 'User visits students page'  do
  let!(:student_1) { create :student, first_name: 'Jan', birthdate: '12/12/1999' }
  let!(:student_2) { create :student, first_name: 'Adam' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
  end

  scenario 'should see students list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Students'
    end

    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Adam'
    expect(page).to have_content '1999-12-12'
  end

  scenario 'only when sign in' do
    logout
    visit students_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
