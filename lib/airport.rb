class Airport
  attr_reader :name

  def initialize(name)
    @name = name
    @planes = []
  end

  def planes
    @planes.map {|plane| plane.flight_id}
  end

  def land(plane)
    @planes.push(plane)
    "#{plane.flight_id} successfully landed at #{@name}"
  end

  def take_off(plane)
    i = @planes.index(plane)
    @planes.delete_at(i)
    "#{plane.flight_id} successfully taken off from #{@name}"
  end

  def confirm_status(plane)
    
  end
end
