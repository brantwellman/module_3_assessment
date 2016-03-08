require 'rails_helper'
require 'spec_helper'

RSpec.feature "user searches for item" do
  it "sees 15 results from a sennheiser search" do
    visit "/"

    fill_in "Search info:", with: "sennheiser"
    click_on "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("")
    expect(page).to have_content("sku")
    expect(page).to have_content("name")
    expect(page).to have_content("customer average review")
    expect(page).to have_content("short description")
    expect(page).to have_content("sale price")
    expect(page).to have_content("image")
  end
end
