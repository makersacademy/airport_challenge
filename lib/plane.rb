require_relative './safety'

class Plane
  include Safety
  attr_reader :status

  def initialize
    @status = 'airborne'
  end

  def land(airport)

  end

  def take_off(airport)

  end

end
