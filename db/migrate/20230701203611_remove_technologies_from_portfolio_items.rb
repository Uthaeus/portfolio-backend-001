class RemoveTechnologiesFromPortfolioItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :portfolio_items, :technologies, :string
  end
end
