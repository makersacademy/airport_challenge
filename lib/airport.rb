class Airport
  attr_accessor :plane

  def initialize
    @planes = []
    @climate = Weather.new.instance_variable_get(:@climate)
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    if @planes.empty?
      raise 'No planes present'
    elsif @climate > 3
      raise 'Take-off prevented, inclement weather'
    else
      @planes.pop && "#{plane} has taken off"
    end
  end

  private
  def empty?
    @planes.size.zero?
  end
end

class Weather

  def initialize
    @climate = rand(0..5)
  end
end

class Plane
end
