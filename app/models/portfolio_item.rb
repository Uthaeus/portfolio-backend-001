class PortfolioItem < ApplicationRecord
    validates_presence_of :title, :description

    mount_uploader :image, PortfolioUploader

    has_many :portfolio_comments, dependent: :destroy
    has_many :technologies, dependent: :destroy
end
