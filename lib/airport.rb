require_relative 'plane'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = Array.new
  end

  def parked?(plane)
    hangar.include?(plane)
  end

end
