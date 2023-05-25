class Event < ApplicationRecord

  has_one_attached :background_image
  belongs_to :user

  validates :title, presence: :true, on: [:create, :update]
end
