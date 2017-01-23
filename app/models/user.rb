class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:twitter, :facebook, :google_oauth2, :yahoo_oauth2]

  def self.from_omniauth(auth)
    puts "#{auth}"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      auth.provider.eql?"twitter" ? user.email = auth.info.email : user.email = auth.email
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end
  def email_required?
    false
  end
end
