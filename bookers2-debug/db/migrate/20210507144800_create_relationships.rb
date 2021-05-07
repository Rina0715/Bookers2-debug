class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.belongs_to :follower, foreign_key: true
      t.belongs_to :followed, foreign_key: false

      t.timestamps
    end
  end
end
