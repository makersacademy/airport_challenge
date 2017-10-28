class Airport
  attr_accessor :planes, :stormy

  def initialize(stormy = false)
    @planes = []
    @stormy = stormy
  end

  def land(plane)
    fail "plane already in airport" if present?(plane)
    add_plane(plane)
  end

  def take_off(plane)
    fail "plane not in airport" unless present?(plane)
    fail "the weather is stormy" if @stormy
    remove_plane(plane)
  end

  def change_weather
    #@stormy = Weather.new.stormy?
  end

  private

  def present?(plane)
    @planes.include?(plane)
  end

  def remove_plane(plane)
    @planes.delete(plane)
  end

  def add_plane(plane)
    @planes << plane
  end
end
