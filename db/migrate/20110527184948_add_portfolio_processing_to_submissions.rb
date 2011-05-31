class AddPortfolioProcessingToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :portfolio_processing, :boolean
  end

  def self.down
    remove_column :submissions, :portfolio_processing
  end
end
