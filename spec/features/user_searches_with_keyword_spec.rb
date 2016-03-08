require 'rails_helper'
require 'spec_helper'

RSpec.feature "user searches for item" do
  it "sees 15 results from a sennheiser search" do
    visit "/"

    fill_in "Search info:", with: "sennheiser"
    click_on "Search"
# search is only coming up with 10 results :(
    expect(current_path).to eq("/search")
    expect(page).to have_content("sku: 4763330")
    expect(page).to have_content("Name: Galaxy Audio - Headset Microphone - Beige")
    expect(page).to have_content("Average cutomer review: 2.7")
    expect(page).to have_content("Description: From our expanded online assortment; TalkThrough function; NoiseGard Digital noise cancellation; 10mm drivers")
    expect(page).to have_content("Price: 229.99")
    expect(page).to have_xpath("/html/body/ul[9]/li[6]/img")
  end
end
