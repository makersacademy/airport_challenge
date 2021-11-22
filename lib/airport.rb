require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 100
  include Weather
  attr_reader :hangar
  attr_reader :capacity
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def hangar_full?
    @hangar.count >= @capacity
  end

  # def weather_ok?
  #   rand < 0.8
  # end

  def holding?(plane)
    @hangar.include?(plane)
  end

  def remove_from_hangar(plane)
    @hangar.delete(plane)
  end

  def add_to_hangar(plane)
    @hangar << plane
  end
  
end
