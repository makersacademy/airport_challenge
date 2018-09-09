# Plane object initialises with a name method based on argument.
# Defaults to a randomly generated one by default

class Plane
  attr_reader :name
  
  def initialize(name = "Plane #{rand(100)}")
    @name = name
  end
end
