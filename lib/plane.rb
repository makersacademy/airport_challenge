class Plane
  attr_reader :name
  attr_accessor :landed

  def initialize(name = self)
    @name = name
    @landed = false
  end

  def landed?
    @landed
  end

end
