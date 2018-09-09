class Plane
  attr_reader :name
  
  def initialize(name = "Plane #{rand(100)}")
    @name = name
  end
end
