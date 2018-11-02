require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :hangar
  attr_accessor :weather

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def plane_in_hangar?(plane)
    @hangar.include?(plane)
  end

end
