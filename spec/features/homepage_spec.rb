require "spec_helper.rb"

feature "homepage" do
  scenario "should have a button" do
    visit "/"
    expect(page).to have_content("Register")
  end
end