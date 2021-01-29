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
end
