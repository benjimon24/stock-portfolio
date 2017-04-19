class Stock < ApplicationRecord
  validates :name, :buy_price, :volume, :symbol, presence: true
  belongs_to :portfolio

  def current_price
    StockQuote::Stock.json_quote(self.symbol)["quote"]["Ask"].to_f
  end

  def current_value
    self.current_price * self.volume
  end

  def cost_basis
    self.volume * self.buy_price
  end

  def net_profit
    self.current_value - self.cost_basis
  end

  def percent_change
    ((self.net_profit / self.cost_basis) * 100).round(2)
  end
end
