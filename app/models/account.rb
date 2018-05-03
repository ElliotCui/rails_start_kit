class Account < ApplicationRecord
  has_many :account_groups
  has_many :groups, through: :account_groups
  has_one :user_profile

  before_save :encrypt_password
  after_save :generate_groupships

  validates_confirmation_of :password
  validates :name,          presence: true
  validates :email,         presence: true, uniqueness: true
  validates :password,      presence: true, on: :create

  attr_accessor :password, :password_confirmation
  attr_accessor :group_names

  def is_super?
    self.account_groups.find_by(group_id: Group::ADMIN_ID)
  end

  def authenticate_by(password)
    if self.password_hash == BCrypt::Engine.hash_secret(password, self.password_salt)
      true
    else
      false
    end
  end

  private

  def encrypt_password
    if self.password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

    true
  end

  def generate_groupships
    groups = Group.where(name: self.group_names)
    groups.each do |group|
      self.account_groups.find_or_create_by(group_id: group.id)
    end

    true
  end
end