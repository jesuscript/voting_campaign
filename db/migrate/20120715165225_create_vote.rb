class CreateVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :campaign, :null => false
      t.references :candidate, :null => false

      t.string :message_timestamp, :null => false
      t.string :validity, :null => false
      t.string :conn, :null => false
      t.string :msisdn, :null => false
      t.string :guid, :null => false
      t.string :shortcode, :null => false

      t.timestamps
    end
  end
end
