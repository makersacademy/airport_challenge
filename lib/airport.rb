class Airport

  WEATHER = ["sunny", "sunny", "sunny", "stormy"]
  DEFAULT_CAPACITY = 10

  def initialize(num = DEFAULT_CAPACITY)
    @hangar = 0
    @capacity = num
  end    

  def hangar_capacity
    @capacity
  end

  def land_sunny
    fail "Hangar is full" if @hangar == 1
    @hangar += 1
    "Landed safely"
  end

  def land_stormy
    fail "Too dangerous to land" if WEATHER[3] == "stormy"
    fail "Hangar is full" if @hangar == 1
    @hangar += 1
    "Landed safely"
  end

  def take_off_sunny
    if WEATHER[1] == "stormy"
      fail "Too dangerous to take off"
    else
      "Plane left hangar safely"
    end
  end

  def take_off_stormy
    if WEATHER[3] == "stormy"
      fail "Too dangerous to take off"
    else
      "Plane left hangar safely"
    end
  end

end

