class CreateTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies do |t|
      t.string :name
      t.references :portfolio_item, null: false, foreign_key: true
      t.integer :percent_utilized

      t.timestamps
    end
  end
end
