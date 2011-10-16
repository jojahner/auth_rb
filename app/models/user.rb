class User
  include Mongoid::Document

  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => { email: false, username: false, login: true },
         :token_authentication_key => :bearer_token
         
  field :username, :type => String
  field :admin,    :type => Boolean, :default => false

  has_many :logins
  
  attr_accessor :login
  attr_accessible :login, :username, :email, :password, :password_confirmation

  validates :username, :presence => true, :uniqueness => true
    
  def to_param
    username
  end
  
  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    self.any_of({ username: login }, { email: login }).first
  end
  
  def self.find_for_token_authentication(conditions)
    User.first
  end
end
