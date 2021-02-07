class Plane
  attr_reader :status

  def initialize
    @status = "unassigned"
  end

  def land(airport)
    if self.status != "flying" && self.status != "unassigned"
      fail 'This plane is not in the air!'
    else
      fail 'This airport is full.' if airport.full?
      fail 'The weather is too stormy for landing right now.' if airport.stormy?
      airport.planes << self
      @status = "landed at #{airport}"
    end
  end

  def take_off(airport)
    fail 'This plane is not at that airport!' if !airport.planes.include?(self)
    fail 'The weather is too stormy for take off right now.' if airport.stormy?
    airport.planes.delete(self)
    @status = "flying"
  end

end
