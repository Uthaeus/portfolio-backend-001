class Technology < ApplicationRecord
  belongs_to :portfolio_item

  validates_presence_of :name, :percent_utilized

  mount_uploader :image, TechnologyUploader
end
