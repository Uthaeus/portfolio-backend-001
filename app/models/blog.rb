class Blog < ApplicationRecord
    validates_presence_of :title, :body

    belongs_to :category

    has_many :blog_comments, dependent: :destroy

    mount_uploader :image, BlogUploader
end
