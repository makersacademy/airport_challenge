class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar, :capacity, :name

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @hangar = []
    @capacity = capacity
  end
  def land plane
    raise "Plane #{plane.id} Cannot Land. Already Landed!" if already_landed? plane
    raise "Plane #{plane.id} Cannot Land. Airport Full!" if full?
    raise "Plane #{plane.id} Cannot Land. Bad Weather!" if bad_weather?
    plane.flying = false
    plane.location = name
    @hangar << plane
    in_airport? plane.id
  end
  def take_off plane
    raise "Plane #{plane.id} Cannot Take Off. Bad Weather!" if bad_weather?
    raise "Plane #{plane.id} Cannot Take Off. Already Taken Off!" if already_flying? plane
    raise "Plane #{plane.id} Cannot Take Off. Unknown Plane!" if !in_airport? plane.id
    plane.location = nil
    remove plane
  end
  def weather_conditions
    [:sunny, :stormy].shuffle.first
  end

  private
  def in_airport? id
    # Is a plane with this ID currently landed
    # at this airport?
    @hangar.any? {|plane| plane.id == id}
  end
  def remove plane
    location = @hangar.find_index {|p| p.id == plane.id}
    @hangar[location].flying = false
    @hangar.delete_at location
    not in_airport? plane.id
  end
  def full?
    @hangar.count >= @capacity
  end
  def already_landed? plane
    in_airport?(plane.id) || !plane.flying
  end
  def already_flying? plane
    plane.flying
  end
  def bad_weather?
    weather_conditions == :stormy
  end
end
