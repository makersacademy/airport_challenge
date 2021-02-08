class Plane
  attr_reader :status

  def initialize
    @status = "unassigned"
  end

  def land(airport)
    landing_errors(airport)
    airport.planes << self
    @status = "landed at #{airport}"
    return self
  end

  def take_off(airport)
    take_off_errors(airport)
    airport.planes.delete(self)
    @status = "flying"
    return self
  end

  private

  def landing_errors(airport)
    fail 'This plane is not in the air!' if @status != "flying" && @status != "unassigned"

    fail 'This airport is full.' if airport.full?

    fail 'The weather is too stormy for landing right now.' if airport.stormy?

  end

  def take_off_errors(airport)

    fail 'This plane is not at that airport!' unless airport.planes.include?(self)

    fail 'The weather is too stormy for take off right now.' if airport.stormy?

  end

end
