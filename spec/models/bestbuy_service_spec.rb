require 'rails_helper'
require 'spec_helper'

RSpec.describe "bestbuy service" do
  it "returns item collection given a search paramater" do
    it "returns items details" do
      VCR.use_cassette("bestbuy_service#item_search") do
        service = BestbuyService.new("sennheiser")

        
      end
    end
  end
end
