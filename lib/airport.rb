require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    if @planes.length >= 10
      raise "Airport full"
    elsif @planes.include?(plane)
      raise "This plane is already in the airport"
    else
      @planes << plane
    end
  end

  def take_off(plane)
    if @planes.length == 0
      raise "There are no planes in the airport"
    elsif !@planes.include?(plane)
      raise "This plane is not in the airport"
    else
      @planes.pop
    end

    # if @capacity.empty?
    #   raise RuntimeError.new("There is no plane in the airport")
    # else @capacity.delete(@plane)
    # end
  end

end
