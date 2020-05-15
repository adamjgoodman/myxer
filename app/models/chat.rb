class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  validates :sender, uniqueness: {scope: :receiver}
  after_create :enter_first_message
  has_many :messages


  def enter_first_message
    first = self.messages.create(body: self.first_message, user_id: self.sender_id)
    first.save!
  end

end
