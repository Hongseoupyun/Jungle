class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 4 }
  before_save { email.downcase! }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    email.downcase!
    email.strip!
    @user = User.find_by_email(email)

    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end
end
  