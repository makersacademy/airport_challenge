class Airport
  attr_reader :id
  attr_reader :aeroplanes
  attr_reader :capacity
  @@airport_count = 0
  def initialize(capacity = 20)
    @aeroplanes = []
    @capacity = capacity
    @@airport_count += 1
    @id = @@airport_count
  end

  def allow_landing(aeroplane)
   aeroplane.land
   @aeroplanes << aeroplane
  end

  def allow_take_off(aeroplane)
    aeroplane.take_off
    @aeroplanes.delete(aeroplane)
  end

  def plane_present?(aeroplane)
    aeroplanes.include?(aeroplane)
  end

  def full?
   @aeroplanes.size == @capacity
  end
end
