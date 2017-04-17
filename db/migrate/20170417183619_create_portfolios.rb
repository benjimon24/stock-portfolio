class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.string :name, null:false
      t.references :user, null:false
    end
  end
end
