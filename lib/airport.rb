class Airport
  attr_accessor :planes, :stormy

  def initialize(stormy = false)
    @planes = []
    @stormy = stormy
  end

  def land(plane)
    fail "plane already in airport" if present?(plane)
    fail "the weather is stormy" if @stormy
    @planes << plane
  end

  def take_off(plane)
    fail "plane not in airport" unless present?(plane)
    fail "the weather is stormy" if @stormy
    @planes.delete(plane)
  end

  def change_weather(*stormy)
    if stormy.empty?
      @stormy = Weather.new.stormy?
    else
      @stormy = stormy[0]
    end
  end

  private

  def present?(plane)
    @planes.include?(plane)
  end

end
