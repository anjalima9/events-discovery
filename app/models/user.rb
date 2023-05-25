class User < ApplicationRecord
  has_one_attached :picture
  has_secure_password
  has_many :event

  validates :username,
    format: { with: /\A[a-zA-Z0-9_]{2,20}\z/,
    message: "ne doit contenir que des caractères alphanumériques ou des _" },
    uniqueness: {case_sensitive: false}

  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP,
    message: "doit être une adresse e-mail valide" },
    uniqueness: {case_sensitive: false}

  def to_session
    {id: id}
  end
end
