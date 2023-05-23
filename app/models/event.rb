class Event < ApplicationRecord

  has_one_attached :background_image

  validates :title, presence: :true, on: [:create, :update]
end
