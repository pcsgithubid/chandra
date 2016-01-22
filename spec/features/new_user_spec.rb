require 'spec_helper'

describe 'create user', :js => true , debug:true do
  it 'new user validations' do
    visit '/'
    click_on 'Add new user'
    fill_in 'Name', :with => 'J. Random Hacker'
    click_on 'create user'
    page.should have_content('There are below errors')
  end
  it 'add new user' do
    visit '/'
    click_on 'Add new user'
    fill_in 'Name', :with => 'J. Random Hacker'
    fill_in 'Mail', :with => 'Awesome post!'
    click_on 'create user'
    page.should have_content('the user added succesfully')
  end
  it 'edit  user' do
    visit '/'
    u=User.first
    within("#content_#{u.id}" , visible: false) do
      click_on 'edit'
      a = page.driver.browser.switch_to.alert
      a.text.should eq("Are you sure?")
      a.accept
    end
    page.find_field('Name').value.should eq 'J. Random Hacker'
    click_on 'create user'
    page.should have_content('succesfully')
  end

end
