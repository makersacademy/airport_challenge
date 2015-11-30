require_relative 'plane'  # => true
require_relative 'stormy'
class Airport

  attr_reader :plane, :planes, :capacity, :stormy  # => nil

  def initialize (capacity = 10)
    @planes = []
    @capacity = capacity
  end

  # Ogni Classe deve essere responsabile di una SOLA cosa. In qst caso lascio il weather
  # ad una classe a se che richiamo ogni volta nell'Airport tramite il def initialize
  # class Weather
  #   def stormy?
  #   end
  # end
  #
  # class Airport
  #   def initialize(weather: Weather.new)
  #   end

  #   private
  #   attr_reader :weather
  #  end

  def land (plane)
    fail_landing(plane)
    planes << plane
    plane
  end

  def take_off (plane)
    fail_take_off(plane)
    planes.delete(plane)
  end

  # def stormy?
  #   @stormy = true
  # end

  private
  def fail_landing(plane)
    fail 'is full' if full?
    fail 'is stormy' if stormy == true
    fail 'plane on ground' if plane.flying == false
  end

  def fail_take_off(plane)
    fail 'is stormy' if stormy
    fail 'is flying' if plane.flying == true
  end

  def full?
    @planes.count >= capacity
  end

end
