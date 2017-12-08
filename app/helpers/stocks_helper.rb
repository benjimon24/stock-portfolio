module StocksHelper

  # stock search api no longer works
  # def parse(params)
  #   root =  "https://stocksearchapi.com/api/?search_text=#{params}&api_key=#{api_key}"
  #   response_string = Net::HTTP.get(URI(root))
  #   if response_string.empty?
  #     return nil
  #   else
  #     return JSON.parse(response_string)
  #   end
  # end

  def portfolios_with(stock)
    current_user.portfolios.select do |portfolio|
      portfolio.stocks.find_by(symbol: stock.upcase)
    end
  end
end
