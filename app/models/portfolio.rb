class Portfolio < ApplicationRecord
    validates :name, presence: true
    belongs_to :user
    has_many :stocks, dependent: :destroy

    def current_value
      stocks.inject(0) {|total, stock| total += stock.current_value}.round(2)
    end

    def cost_basis
      stocks.inject(0) {|total, stock| total += stock.cost_basis}.round(2)
    end

    def net_profit
      stocks.inject(0) {|total, stock| total += stock.net_profit}.round(2)
    end

    def percent_change
      if cost_basis == 0
        return 0
      else
        (net_profit / cost_basis * 100).round(2)
      end
    end

end
