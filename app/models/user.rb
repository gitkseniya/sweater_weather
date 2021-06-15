class User < ApplicationRecord

  validates :password, confirmation: { case_sensitive: true }
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true, presence: true

  def update_api_key
    update(api_key: "123xyz")
  end
end
