class Airport
  
  attr_reader :name, :planes
  
  def initialize(name="test")
    @name = name
    @capacity = 1
    @planes = []
  end
end