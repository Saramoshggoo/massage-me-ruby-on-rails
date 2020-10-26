class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  #last 20 messages got displayed
  scope :custom_display, -> { order(:created_at).last(20) }
end
