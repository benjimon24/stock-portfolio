class StocksController < ApplicationController
  include StocksHelper
  include UsersHelper

  def search
    @response = parse(params[:id])
  end

  def show
    @stock = StockQuote::Stock.json_quote(params[:id])["quote"]
    @portfolios = portfolios_with(params[:id])
  end

  private
    def api_key
      "ad66629db14dad47e02a19f582436c500560afcc"
    end
end
