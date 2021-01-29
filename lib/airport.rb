class Airport
  attr_reader :name, :capacity

  def initialize(name, capacity = 2)
    @name = name
    @capacity = capacity
    @planes = []
  end

  def planes
    @planes.map { |plane| plane.flight_id }
  end

  def land(plane)
    if full?
      raise "Landing denied"
    else
      @planes.push(plane)
      "#{plane.flight_id} successfully landed at #{@name}"
    end
  end

  def take_off(plane)
    i = @planes.index(plane)
    @planes.delete_at(i)
    "#{plane.flight_id} successfully taken off from #{@name}"
  end

  def confirm_status(flight_id)
    if @planes.map { |plane| plane.flight_id }.include?(flight_id)
      "#{flight_id} is at #{@name}"
    else
      "#{flight_id} is in flight"
    end
  end

  private
  def full?
    @planes.length >= @capacity
  end
end
