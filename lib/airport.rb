class Airport
  attr_reader :base
  def initialize
    @base = []
  end

  def add(plane)
    @base.push(plane)
  end
end
