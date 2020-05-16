class AddGiveawayWinnerToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :giveaway_winner, :boolean, default: false
  end

  def down
    remove_column :users, :giveaway_winner, :boolean, default: false
  end
end
