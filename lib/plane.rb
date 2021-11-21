require_relative 'airport'

class Plane
  attr_reader :status
# assume plane is create at the airport
  def initialize
    @status = false
  end

  def landed
    !@status
  end

  def taken_off
    @status
  end
end
