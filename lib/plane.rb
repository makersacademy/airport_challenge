class Plane
  attr_reader :model

  def initialize(model)
    @model = model
    @landed = false
  end

  def landed?
    @landed
  end

  def landing
    @landed = true
  end

  def taking_off
    @landed = false
  end

end
