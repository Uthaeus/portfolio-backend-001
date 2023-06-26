class Category < ApplicationRecord
    has_many :blogs, dependent: :destroy
    validates_presence_of :name
end
