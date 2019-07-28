class Airport
  puts "Welcome to airport"

  DEFAULT_CAPACITY = 3

  def initialize(location="unknown", capacity=DEFAULT_CAPACITY)
    @location = location
    @capacity = capacity
    @plane_list = []
  end

  def land(flight_number, weather)
    if weather == 1
      puts "Can not land due to stormy weather"
      return
    end

    if @plane_list.size == @capacity
      puts "Can not land due to full airport"
      return
    end

    if @plane_list.include?(flight_number)
      raise "The input flight is already in the airport"
    end

    @plane_list << flight_number
  end

  def takeoff(flight_number, weather)
    if weather == 1
      puts "Can not take off due to stormy weather"
      return
    end

    if !@plane_list.include?(flight_number)
      puts "Flight not in airport"
    end
    @plane_list.delete(flight_number)
  end

  def include?(flight_number)
    @plane_list.include?(flight_number)
  end

end
