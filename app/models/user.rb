class User < ApplicationRecord
  require 'open-uri'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar
  has_many :likes, dependent: :destroy
  has_many :contacts

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
    end
    user
end

end
