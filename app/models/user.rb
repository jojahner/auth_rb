class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => { email: false, username: false, login: true },
         :token_authentication_key => :bearer_token
         
  field :username, :type => String
  field :admin,    :type => Boolean, :default => false

  validates :username, :presence => true, :uniqueness => true
  
  attr_accessor :login
  attr_accessible :login, :username, :email, :password, :password_confirmation
  
  def to_param
    username
  end
  
  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    self.any_of({ username: login }, { email: login }).first
  end
  
  def self.find_for_token_authentication(conditions)
    User.first
    # where(["access_grants.access_token = ?", conditions[token_authentication_key]]).joins(:access_grants).select("users.*").first
  end
end
