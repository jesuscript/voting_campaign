class AddForeignKeysToVotes < ActiveRecord::Migration
  def change
    add_foreign_key :votes, :campaigns
    add_foreign_key :votes, :candidates
  end
end
