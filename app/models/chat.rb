class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validates :sender, uniqueness: {scope: :receiver}
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
  after_create :enter_first_message
  scope :participating, -> (user) do
    where("(chats.sender_id = ? OR chats.receiver_id = ?)", user.id, user.id)
  end

  def enter_first_message
    first = self.messages.create(body: self.first_message, user_id: self.sender_id)
    first.save!
  end

end
