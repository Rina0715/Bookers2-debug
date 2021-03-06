class CreateRelationships < ActiveRecord::Migration[5.2]

  def change
    create_table :relationships do |t|
      t.integer :follower, foreign_key: true
      t.integer :followed, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end

end
