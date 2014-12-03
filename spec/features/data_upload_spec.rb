require 'rails_helper'

feature "Data Upload" do
  scenario "visit the upload page and see the form" do
    visit "/upload" 
    expect(page).to have_text("Please upload a data file")
    expect(page).to have_field("File")
  end 

  scenario "upload a file" do
    visit "/upload"
    page.attach_file('File', 'example_input.tab')
    click_button('Upload')
    expect(page).to have_text('example_input')
    expect(page).to have_text('$95.00')
  end
end