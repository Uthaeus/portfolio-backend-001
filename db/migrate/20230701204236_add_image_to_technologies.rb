class AddImageToTechnologies < ActiveRecord::Migration[7.0]
  def change
    add_column :technologies, :image, :string
  end
end
