class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  validates :sender, uniqueness: {scope: :receiver}
  before_validation :add_id
  after_create :enter_first_message
  has_many :messages

  def enter_first_message
    first = self.messages.create(body: self.first_message, user_id: self.sender_id)
    first.save!
    receiver = User.find_by(id: self.receiver_id)
    receiver.increment!(:unread)
    receiver.save!
  end

  def add_id
    user = User.find_by(username: self.receiver_username)
    self.receiver_id = user.id
  end

end
