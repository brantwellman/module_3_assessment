class BestbuyService
  attr_reader :connection, :search_params

  def initialize(search_data)
    @search_params = search_date
    @connection = Faraday.new("https://api.bestbuy.com")
  end

  def products
    data = parse(connection.get("/v1/products"))
  end



end
