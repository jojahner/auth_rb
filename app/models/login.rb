class Login
  include Mongoid::Document
    
  belongs_to :user
  belongs_to :application
  
  validates :user,        :presence => true
  validates :application, :presence => true
end
