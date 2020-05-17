require './lib/plane.rb'
class Airport
  def initialize(capacity = 20)
    @planes_in = []
    @capacity = capacity
  end

  def show_planes_in
    @planes_in
  end

  def land(plane)
    if full?
      raise 'no space for landing'

    end

    if forecast == 20
      raise 'too stormy to land' if forecast == 20

    end

    if plane_already_in?(plane)
      raise 'this plane is already in the airport' if @planes_in.include?(plane)

    end
    @planes_in << plane
  end

  def take_off(plane)
    if forecast == 20
      raise 'too stormy to take-off'

    end

    if plane_already_in?(plane) == false
      raise 'this plane is not in this airport'

    end

    @planes_in.delete(plane)
    @planes_in
  end

  def full?
    @planes_in.length == @capacity
  end

  def plane_already_in?(plane)
    @planes_in.include?(plane)
  end

  def forecast
    rand(1..20)
  end
end
