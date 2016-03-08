require "rails_helper"
require "spec_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "returns all of the items in the proper format" do
    item1 = Item.create(name: "item1", description: "it does stuff")
    item2 = Item.create(name: "item3", description: "it does more stuff")

    get :index, format: :json

    parsed_items = JSON.parse(response.body)
    parsed_one = parsed_items.first
    parsed_two = parsed_items.last

    expect(response.status).to eq(200)
    expect(parsed_one.name).to eq("item1")
    expect(parsed_two.description).to eq("it does more stuff")
    expect(parsed_items.count).to eq(2)
  end

end
