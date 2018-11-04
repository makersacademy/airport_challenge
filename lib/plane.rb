require_relative 'airport'

class Plane

  attr_accessor :status

  DEFAULT_STATUS = 'flying'

  def initialize
    @status = DEFAULT_STATUS
  end

  def land(airport)
    fail 'This plane has already landed' if landed?
    @status = airport
    self
  end

  def take_off
    fail 'This plane is already in the air' unless landed?
    @status = DEFAULT_STATUS
    self
  end

  private

  def landed?
    @status != 'flying'
  end

end
