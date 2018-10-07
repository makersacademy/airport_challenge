class Airport
  attr_reader :name

  def initialize(name = self)
    @name = name
  end

  def list_planes
    "There are no planes in the airport."
  end
end
