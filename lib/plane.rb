class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def landing_approved? #need to tie this back to airport.rb
    true    
  end


  def landed?
    !@flying
  end



end
	


			