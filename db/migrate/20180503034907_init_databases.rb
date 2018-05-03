class InitDatabases < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, limit: 32

      t.timestamps
    end

    create_table :account_groups do |t|
      t.integer :account_id
      t.integer :group_id

      t.timestamps
    end

    create_table :accounts do |t|
      t.string :name, limit: 32
      t.string :email, limit: 191
      t.string :password_salt
      t.string :password_hash
      t.boolean :is_active

      t.timestamps
    end
  end
end
