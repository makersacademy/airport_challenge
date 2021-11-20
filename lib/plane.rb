require_relative 'airport'

class Plane
  attr_reader :status
# assume plane is create at the airport
  def initialize
    @status = true
  end
  
  def landed
    @status = true
  end

  def taken_off
    @status = false
  end
end
