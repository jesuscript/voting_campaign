class CreateVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :campaign, :null => false
      t.references :candidate, :null => false
      
      t.string :validity
      t.string :conn
      t.string :msisdn
      t.string :guid
      t.integer :shortcode
      t.boolean :error, :default => false

      t.timestamps
    end
  end
end
