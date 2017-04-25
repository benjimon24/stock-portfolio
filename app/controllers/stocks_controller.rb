class StocksController < ApplicationController

  def search
    root =  "https://stocksearchapi.com/api/?search_text=#{params[:id]}&api_key=#{api_key}"
    @response = JSON.parse(Net::HTTP.get(URI(root)))
    # binding.pry
    # if @response.empty?
    #   @response = ["No results found."]
    # else
    #   render json: @response
    # end
  end

  def show
    @stock = StockQuote::Stock.json_quote(params[:id])["quote"]
  end

  private
    def api_key
      "ad66629db14dad47e02a19f582436c500560afcc"
    end
end
