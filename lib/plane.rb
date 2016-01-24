class Plane
  
  attr_accessor :flying
  attr_reader :name
  
  def initialize
    @name = "737-" + "#{1}" #will be @planes.size maybe?
    @flying = false
  end
  
  
end