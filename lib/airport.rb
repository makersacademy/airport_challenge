class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def add_plane(plane)
    raise "#{self.class.name} full" if full?
    planes << plane
  end

  
  def take_off(plane)
    raise "#{self.class.name} empty" if empty?
    planes.delete(plane)
  end

  
  def empty?
    planes.empty?
  end

  def full?
    planes.count >= capacity
  end
  
  def view_planes
    list = []
    planes.each {|i| list << "#{i.name}" } 
    return list.join(" | ") 
  end

  private
  attr_reader :bikes

end