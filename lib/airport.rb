class Airport
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def land(plane)
    "#{plane.flight_id} successfully landed at #{@name}"
  end
end
