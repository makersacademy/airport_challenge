require_relative 'airport'
require_relative 'weather'

class Airplane

attr_reader :landed

  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  def take_off
    @landed = false
  end

  def land
    @landed = true
  end

end
