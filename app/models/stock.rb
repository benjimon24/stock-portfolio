class Stock < ApplicationRecord
  validates :symbol, :buy_price, :volume, presence: true
  belongs_to :portfolio

  def current_price
    StockQuote::Stock.quote(self.symbol).latest_price #.delete(',').to_f
  end

  def current_value
    (current_price * volume).round(2)
  end

  def cost_basis
    (volume * buy_price).round(2)
  end

  def net_profit
    (current_value - cost_basis).round(2)
  end

  def percent_change
    (net_profit / cost_basis * 100).round(2)
  end

  def buy(quantity)
    total_value = (cost_basis + current_price * quantity).round(2)
    self.volume += quantity
    self.buy_price = (total_value / volume).round(2)
    self.save
  end

  def sell(quantity)
    if (volume - quantity) <= 0
      self.destroy
    else
      self.volume -= quantity
    end
    self.save
  end

end
