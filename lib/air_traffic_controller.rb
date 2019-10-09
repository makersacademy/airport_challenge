
class AirTrafficController
  attr_reader :hanger, :capacity
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
    @hanger.each_with_index do |plane, index|
      if plane == plane
        @hanger.delete_at(index)
      end
    end
  end

  private

  def full?
    @hanger.count >= capacity
  end
end
