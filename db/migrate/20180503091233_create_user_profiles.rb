class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.integer :account_id
      t.string :name
      t.string :avatar

      # TODO: 在这里添加你的项目中用户的基本信息

      t.timestamps
    end
  end
end
