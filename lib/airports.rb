require_relative './planes.rb'
require_relative './weather.rb'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :planes, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    check_landing_issues(plane)
    @planes << plane
    plane.change_status
  end

  def take_off(plane)
    check_take_off_issues(plane)
    @planes.delete(plane)
    plane.change_status
  end

  def airport_include?(plane)
    @planes.include?(plane)
  end

  private
  def at_capacity?
    @planes.size >= capacity
  end

  def check_landing_issues(plane)
    raise 'The plane is already landed somewhere' if plane.landed?
    raise 'Airport at capacity' if at_capacity?
    raise 'Too stormy to land' if @weather.stormy?
  end

  def check_take_off_issues(plane)
    raise 'The plane is not landed here' unless @planes.include?(plane)
    raise 'Too stormy to take off' if @weather.stormy?
  end
end
