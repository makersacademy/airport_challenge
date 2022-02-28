require_relative 'plane'

class Airport

  attr_accessor :planes
  attr_reader :default_capacity
  attr_reader :weather

  def initialize(capacity = 25)
    @planes = []
    @default_capacity = capacity
  end

  def land_plane(plane)
    if is_full?
      raise Exception.new "A plane can't land if the airport is full"
    elsif @planes.include?(plane)
      raise Exception.new "A plane can't land at an airport it already has landed at"
    elsif weather == "Stormy"
      raise "A plane can't land if the weather is stormy"
    else
      @planes << plane
    end
  end

  def take_off_plane(plane)
    if !@planes.include?(plane)
      raise Exception.new "This plane isn't at this airport"
    elsif weather == "Stormy"
      raise "A plane can't take off if the weather is stormy"
    else
      return @planes.pop
    end
  end

  def show_current_planes
    return @planes
  end

  def weather
    rand() > 0.9 ? "Stormy" : "Clear"
  end

  private

  def is_full?
    @planes.size == @default_capacity ? true : false
  end
end
