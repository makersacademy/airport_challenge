class Airport

  def initialize
    @planes = []
  end

  attr_reader :planes, :weather

  def random_generator
    rand(1..5)
  end

  def check_storm?
    random_generator == 5
  end

  def landing_take_off_error
    raise 'Cannot land or take off in storm' if check_storm
  end

  def land(plane)
    raise 'Cannot land in storm' if check_storm?
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off in storm' if check_storm?
    @planes.delete(plane)
  end

end
