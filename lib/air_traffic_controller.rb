
class AirTrafficController
  attr_reader :plane, :hanger, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
  end

  def plane_landing(plane)
    raise "hanger full" if full?
    @hanger << plane
  end

  def plane_taking_off(plane)
    counter = -1
    @hanger.each do |e|
      counter += 1
      if e == plane
        @hanger.delete_at(counter)
      end
    end
  end

  private

  def full?
    @hanger.count >= capacity
  end
end
