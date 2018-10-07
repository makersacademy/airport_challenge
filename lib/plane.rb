class Plane
  attr_reader :name

  def initialize(name = self)
    @name = name
  end

  def location
    "factory"
  end
end
