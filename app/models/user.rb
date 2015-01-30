class User < ActiveRecord::Base

  has_secure_password
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_confirmation_of :password, :message => 'Hasła do siebie nie pasują', :allow_blank => true
  validates :password,:presence => {:message => 'Hasło jest wymagane!'}
  validates :password_confirmation,:presence => {:message => 'Potwierdzenie hasła jest wymagane!'}
  validates_length_of :password, :minimum => 5, :message => 'Za krótkie hasło (co najmniej 5 znaków)', :allow_blank => true
  validates_presence_of :email, :message => 'Adres email jest wymagany!'
  validates_uniqueness_of :email, :message => 'Użytkownik o podanym adresie już istnieje!'
  validates :email, :format => EMAIL_REGEX, :allow_blank => true

end
