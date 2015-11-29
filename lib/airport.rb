class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    fail 'That is not a plane!' if plane.class.to_s != 'Plane'
    fail 'Weather is too stormy!' if stormy?
    plane.land self
    planes << plane
    self
  end

  def take_off plane
    fail 'Plane not found!' unless contain? plane
    fail 'Weather is too stormy!' if stormy?
    plane.take_off 
    planes.delete plane
    self
  end

  def contain? plane
    planes.include? plane
  end

  def stormy?
    rand(20) == 0 ? true : false
  end

end
