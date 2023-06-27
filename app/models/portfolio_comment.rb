class PortfolioComment < ApplicationRecord
  belongs_to :portfolio_item
  belongs_to :user

  validates_presence_of :content
end
