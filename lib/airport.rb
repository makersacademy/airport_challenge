require_relative 'plane'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = Array.new
  end

  def contains?(plane)
    hangar.include?(plane)
  end

  def full?
    raise "Landing not permitted: airport full!" if hangar.size == 10
  end

end
