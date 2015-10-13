require 'rails_helper'

describe "the add a list process" do
  it "adds a new list" do
    visit new_list_path
    fill_in 'Name', :with => 'Home stuff'
    click_on 'Create List'
    expect(page).to have_content 'Lists'
  end
end
