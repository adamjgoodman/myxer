class User < ApplicationRecord
  has_many :myxes
  has_one :profile
  after_create :make_profile
  has_many :chats
  has_many :authored_conversations, class_name: 'Chat', foreign_key: 'sender_id'
  has_many :received_conversations, class_name: 'Chat', foreign_key: 'received_id'
  has_many :messages, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  attr_writer :login

  def make_profile
    profile = Profile.create(user_id: self.id)
    profile.save!
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
