class AddCategoryReferenceToBlog < ActiveRecord::Migration[7.0]
  def change
    add_reference :blogs, :category, foreign_key: true
  end
end
