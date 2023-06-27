class AddAuthorToPortfolioComment < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolio_comments, :author, :string
  end
end
