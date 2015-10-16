class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :hangar, :capacity

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
  end
  def land plane
    raise "Plane #{plane.id} Already Landed!" if in_airport?(plane.id)
    @hangar << plane
    in_airport? plane.id
  end
  def take_off id
    remove id
  end

  private
  def in_airport? id
    # Is a plane with this ID currently landed
    # at this airport?
    @hangar.any? {|plane| plane.id == id}
  end
  def remove id
    raise 'Unknown Plane' if !in_airport? id
    @hangar.delete_at @hangar.find_index {|plane| plane.id == id}
    not in_airport? id
  end
end
