class Group < ApplicationRecord
  has_many :account_groups
  has_many :accounts, through: :account_groups

  ADMIN_ID = 1
  NORMAL_ID = 2
end