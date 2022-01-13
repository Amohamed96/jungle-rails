class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true, length: {minimum: 3}
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, :case_sensitive => false

  def self.authenticate_with_credentials(email, password)
    # Handle user error with trailing spaces and ignore case on email
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end