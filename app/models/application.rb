class Application
  include Mongoid::Document
  
  after_create :generate_keys
  
  field :name,       :type => String
  field :key,        :type => String
  field :secret_key, :type => String
  
  validates :name,       presence: true
  
private
  
  def generate_keys
    self.key        = SecureRandom.hex(16)
    self.secret_key = SecureRandom.hex(32)
  end
end
