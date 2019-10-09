class Airport
  attr_accessor :hangar
  attr_accessor :capacity

  def initialize(capacity)
    @hangar = []
    @capacity = capacity
  end

  def land(planes)
    fail "Airport is full" if full?
    fail "conditions are stormy" if stormy == "stormy"

    if stormy == "sunny"
      @hangar << planes
    end
  end

  def take_off
    fail "there are no more planes in the airport" if empty?

    @hangar.pop
  end


  def empty?
    @hangar.empty?
  end

  def full?
    @hangar.count >= capacity
  end

  def stormy
    ran_num = rand(1..2)
    if ran_num == 1
      return "stormy"
    elsif ran_num == 2
      return "sunny"
    end
  end
end
