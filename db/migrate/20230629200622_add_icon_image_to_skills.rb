class AddIconImageToSkills < ActiveRecord::Migration[7.0]
  def change
    add_column :skills, :icon_image, :string
  end
end
