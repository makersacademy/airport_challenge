
class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)

  end

  def take_off(plane)

  end

  def empty_error
    raise "No planes available" if empty?
  end

  private

  def empty?
    @planes.empty?
  end
end
