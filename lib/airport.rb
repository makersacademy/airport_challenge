require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def landed?(plane)
    @planes.include?(plane)
  end

  def taken_off?(plane)
    @planes.include?(plane) ? false : true
  end

end
