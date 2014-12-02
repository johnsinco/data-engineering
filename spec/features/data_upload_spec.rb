require 'rails_helper'

feature "Data Upload" do
  scenario "visit the upload page and see the form" do
    visit "/upload" 

    expect(page).to have_text("Please upload a data file")
  end 
end