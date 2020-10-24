require_relative "./weather"
require_relative "./plane"

class Airport

  attr_reader(:capacity)
  attr_reader(:planes)

  def initialize(weather = Weather.new, capacity = 2)
    @local_weather = weather
    @capacity = capacity
    @planes = []
  end

  def takeoff(plane)
    raise "Cant take off due to stormy weather" unless sunny?

    departing_plane = @planes.select { |plane| plane == plane }
    raise "No plane found" unless !departing_plane[0].nil?

    raise "That plane is already flying" unless !flying?(departing_plane[0])

    departing_plane[0].status = "flying"
    @planes.delete(departing_plane[0])
    return departing_plane[0]
  end

  def land(plane)
    raise "That plane isn't in the air" unless flying?(plane)

    raise "Cant land here due to stormy weather" unless sunny?

    raise "Airport is full" unless full?

    plane.status = "landed"
    @planes.push(plane)
    return plane
  end

  private

  def flying?(plane)
    plane.status == "flying"
  end

  def sunny?
    @local_weather.forcast == "sunny"
  end

  def full?
    @planes.count < @capacity
  end

end
