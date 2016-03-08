class BestbuyService
  attr_reader :connection, :search_params

  def initialize(search_data)
    @search_params = search_data
    @connection = Faraday.new("https://api.bestbuy.com")
  end

  def products
    data = parse(connection.get("/v1/products(search=#{search_data})?format=json&show=sku,name,customerReviewAverage,shortDescription,salePrice,image&apiKey=#{ENV['BEST_BUY_KEY']}"))
    binding.pry
  end

  private

    def parse(response)
      JSON.parse(response.body)
    end

end
