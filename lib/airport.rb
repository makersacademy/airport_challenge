class Airport
  attr_reader :parked , :capacity , :weather

  def initialize(capacity)
    @parked = []
    @capacity = capacity
  end

  def land(plane)
    self.full? ? raise : @parked.push(plane)
  end

  def take_off(plane)
    # if self.weather != "stormy"
      @parked = @parked.each_with_index do | plane_id, index |
        @parked.delete_at(index) if plane_id == plane
      end
    # else
      self.parked.include?(plane) ? "#{plane} still at airport" : "#{plane} no longer at airport"
    # end
  end

  def parked
    @parked
  end

  def full?
    self.parked.length >= @capacity
  end

  def space?
    self.parked.length < @capacity
  end

  def override_capacity(new_capacity)
    @capacity = new_capacity
  end

  def weather
    @weather = (rand(101) % 20 == 0 ? "stormy" : "sunny")
  end

end