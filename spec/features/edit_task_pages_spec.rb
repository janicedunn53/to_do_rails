require 'rails_helper'

describe "the edit a task process" do
  it "edits a task" do
    list = List.create(:name => 'Home stuff')
    task = Task.create(:description => 'Wash the dishes', :list_id => list.id)
    visit list_path(list)
    click_on 'Edit'
    fill_in 'Description', :with => 'Wash the dog'
    click_on 'Update Task'
    expect(page).to have_content 'Home stuff'
  end
end
