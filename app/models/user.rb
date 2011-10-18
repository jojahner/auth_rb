class User
  include Mongoid::Document
  authenticates_with_sorcery!
         
  field :username, :type => String
  field :admin,    :type => Boolean, :default => false

  has_many :logins
  
  validates :username, :presence => true, :uniqueness => true
  validates :email,    :presence => true, :uniqueness => true
  validates_confirmation_of :password
  validates_presence_of     :password, :on => :create
  
  attr_accessible :username, :email, :password, :password_confirmation
    
  def to_param
    username
  end
end
