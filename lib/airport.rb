class Airport
  attr_reader :capacity, :planes_on_ground

  MAXCAPACITY = 5

  def initialize
    @planes_on_ground = [:a, :a, :a, :a, :a]
  end

  def full?
    return false if @planes_on_ground.length < MAXCAPACITY
    true
  end

end
