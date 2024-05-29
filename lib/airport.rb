class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def clear_for_landing(flight_number, weather = 1)
    if weather == 1
      @hangar << flight_number
    else
      puts "Due to inclement weather, landing is disabled."
    end
  end

  def clear_for_takeoff(flight_number, weather = 1)
    if weather == 1
      @hangar.delete(flight_number)
    else
      puts "Due to inclement weather, takeoff is disabled."
    end
  end

  def max_capacity(cap_number = 4)
    @hangar.first(cap_number)
  end
end
