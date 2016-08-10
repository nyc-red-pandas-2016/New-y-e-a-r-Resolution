class CreateVotes < ActiveRecord::Migration
  def change

    create_table :votes do |t|
      t.integer :value, default: 0
      t.integer :user_id, null: false
      t.string  :votable_type
      t.integer :votable_id

      t.timestamps null: false
    end

    add_index :votes, [:user_id, :votable_id], unique: true

  end

end
