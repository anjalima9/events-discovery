class Registration < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "id_user"
  belongs_to :event, class_name: "Event", foreign_key: "id_event"

  validates :id_event, presence: true
end
