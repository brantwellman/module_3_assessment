require "rails_helper"
require "spec_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "returns all of the items in the proper format" do
    item1 = Item.create(name: "item1", description: "it does stuff", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
    item2 = Item.create(name: "item2", description: "it does more stuff", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")

    get :index, format: :json

    parsed_items = JSON.parse(response.body)
    parsed_one = parsed_items.first
    parsed_two = parsed_items.last

    expect(response.status).to eq(200)
    expect(parsed_one["name"]).to eq("item1")
    expect(parsed_two["description"]).to eq("it does more stuff")
    expect(parsed_items.count).to eq(2)
  end

  it "returns the specified item in the proper format" do
    item1 = Item.create(name: "item1", description: "it does stuff", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
    item2 = Item.create(name: "item2", description: "it does more stuff", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")

    get :show, id: item1.id, format: :json

    parsed_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_item["name"]).to eq("item1")
  end

  it "deletes the specified item" do
    item1 = Item.create(name: "item1", description: "it does stuff", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
    item2 = Item.create(name: "item2", description: "it does more stuff", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")

    delete :destroy, id: item1.id

    count = Item.all.count
    item = Item.first

    expect(response.status).to eq(204)
    expect(count).to eq (1)
    expect(item.name).to eq("item2")
  end

end
