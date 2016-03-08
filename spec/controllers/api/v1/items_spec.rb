require "rail_helper"
require "spec_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "returns all of the items in the proper format" do
    item1 = Item.create(name: "item1", description: "it does stuff")
    item2 = Item.create(name: "item3", description: "it does more stuff")
    item3 = Item.create(name: "item3", description: "it does lots of stuff")

    
  end

end
