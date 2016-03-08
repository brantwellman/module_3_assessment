class BestbuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com")
  end

  def products
    parse(connection.get("/v1/products"))
  end



end
