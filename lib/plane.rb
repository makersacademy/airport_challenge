require_relative 'airport'

class Plane
    
  attr_reader :location, :status

  def initialize
    @location = :sky
    @status = :flying
  end

  def flying?
    @status == :flying
  end

  def landed
    @location = :airport
    @status = :landed
  end

  def flying
    @location = :sky
    @status = :flying
  end

end
