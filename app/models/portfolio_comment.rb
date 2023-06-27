class PortfolioComment < ApplicationRecord
  belongs_to :portfolio_item
  belongs_to :user
end
