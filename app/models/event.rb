class Event < ApplicationRecord

  has_one_attached :background_image

  has_many :registrations, foreign_key: "id_event"

  validates :title, presence: :true, on: [:create, :update]
end
