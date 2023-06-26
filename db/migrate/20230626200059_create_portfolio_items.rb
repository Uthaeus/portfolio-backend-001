class CreatePortfolioItems < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolio_items do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :url
      t.string :technologies, array: true, default: []

      t.timestamps
    end
  end
end
