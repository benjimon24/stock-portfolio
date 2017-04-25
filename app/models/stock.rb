class Stock < ApplicationRecord
  validates :symbol, :buy_price, :volume, presence: true
  belongs_to :portfolio

  def current_price
    StockQuote::Stock.json_quote(self.symbol)["quote"]["Ask"].to_f
  end

  def current_value
    current_price * volume
  end

  def cost_basis
    volume * buy_price
  end

  def net_profit
    current_value - cost_basis
  end

  def percent_change
    (net_profit / cost_basis * 100).round(2)
  end

  def buy(quantity)
    total_value = cost_basis + current_price * quantity
    self.volume += quantity
    self.buy_price = total_value / volume
  end

end
