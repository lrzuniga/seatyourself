class AddLoyaltyPointsToDiner < ActiveRecord::Migration
  def change
    add_column :diners, :loyalty_points, :integer
  end
end
