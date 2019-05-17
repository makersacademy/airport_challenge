class Airport

  attr_reader :name, :code, :planes

  def initialize(name, code)
    @name = name
    @code = code
    @planes = []
  end

  def receive(plane)
    @planes.push(plane)
  end

end