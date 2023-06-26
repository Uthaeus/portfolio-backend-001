class AddAuthoraToBlogComment < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_comments, :author, :string
  end
end
