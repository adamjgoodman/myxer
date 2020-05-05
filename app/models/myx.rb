class Myx < ApplicationRecord
  belongs_to :user
  validates :message,
  presence: true,
  length: {maximum: 200},
  on: :create,
  allow_nil: false
end
