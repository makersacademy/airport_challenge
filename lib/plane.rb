class Plane
  attr_reader :flying

  def initialize
  		@flying = true
  end 

  def flying?
  		@flying
  		# only flying or landed here
  end 
end
