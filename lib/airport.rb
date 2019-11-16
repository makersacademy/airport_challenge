class Airport
  attr_reader :capacity, :planes_held

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_held = []
  end

  def land(plane, weather)
    if full? || weather.stormy?
      :cannot_land_plane
    elsif @planes_held.include? plane
      :plane_already_landed
    else
      @planes_held << plane
      :successful
    end
  end

  def takeoff(plane, weather)
    if weather.stormy?
      :cannot_take_off
    elsif !@planes_held.include? plane
      :plane_already_flying
    else
      @planes_held.delete(plane)
      :successful
    end
  end

  private

  def full?
    @planes_held.length >= @capacity
  end

end
