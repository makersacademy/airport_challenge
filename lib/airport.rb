class Airport
  attr_reader :parked , :capacity

  def initialize
    @parked = []
    @capacity = 1
  end

  def land(plane)
    self.full? ? raise : @parked.push(plane)
  end

  def take_off(plane)
    @parked = @parked.each_with_index do | plane_id, index |
      @parked.delete_at(index) if plane_id == plane
    end
    self.parked.include?(plane) ? "#{plane} still at airport" : "#{plane} no longer at airport"
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

end