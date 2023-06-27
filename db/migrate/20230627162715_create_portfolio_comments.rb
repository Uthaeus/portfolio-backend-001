class CreatePortfolioComments < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolio_comments do |t|
      t.text :content
      t.references :portfolio_item, null: false, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
