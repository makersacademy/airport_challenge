class Plane
  attr_reader :model
  attr_accessor :landed

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

end
