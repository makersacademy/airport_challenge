require_relative "./weather.rb"
require_relative "./plane.rb"

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY,weather=Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def add_plane(plane)
    raise "#{self.class.name} full" if full?
    raise "Cannot add flying planes" if plane.flying?
    planes << plane
  end

  def take_off(plane)
    raise "#{self.class.name} empty" if empty?
    raise "Plane is not in this airport" if planes.include?(plane) == false
    raise "Cannot take off during storm" if weather.stormy?
    set_airbourne(plane)
    planes.delete(plane)
  end

  def land(plane)
    raise "Cannot land during storm" if weather.stormy?
    raise "Plane has already landed" if plane.flying? == false
    set_grounded(plane)
    add_plane(plane)
  end

  def set_grounded(plane)
    plane.report_landed
  end

  def set_airbourne(plane)
    plane.report_flying
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= capacity
  end
  
  def view_planes
    dummy_list= []
    planes.each {|plane| dummy_list << plane} 
    return dummy_list 
  end

  private
  attr_reader :planes

end