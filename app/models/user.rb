class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create, :message => 'Hasło jest wymagane!'
  validates :password, length: { minimum: 5 }, :message => 'Za krótkie hasło (co najmniej 5 znaków)'
  validates_presence_of :email, :message => 'Adres email jest wymagany!'
  validates_uniqueness_of :email, :message => 'Użytkownik o podanym adresie już istnieje!'
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
