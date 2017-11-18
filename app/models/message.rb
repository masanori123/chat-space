class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :body_or_image, presence: true
  validates :group_id, presence: true
  validates :user_id, presence: true
  mount_uploader :image, ImageUploader

  private
    def body_or_image
      unless body.presence or image.presence
        errors.add(:body, "エラーです")
      end
      body.presence or image.presence
    end
end
