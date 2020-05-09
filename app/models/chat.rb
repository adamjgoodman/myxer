class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validates :sender, uniqueness: {scope: :receiver}
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
  scope :participating, -> (user) do
    where("(chats.sender_id = ? OR chats.receiver_id = ?)", user.id, user.id)
  end
end
