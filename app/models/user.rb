class User < ApplicationRecord

  has_secure_password

  before_validation :normalize_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

  def normalize_email
    self.email = self.email.strip.downcase unless self.email.nil?
  end

  def self.authenticate_with_credentials (email, password)
    @user = self.find_by_email(email.strip.downcase)
    if @user && @user.authenticate(password)
      @user
    else
      return nil
    end
  end 

end
