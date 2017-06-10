class Airport
  attr_reader :gates

  def initialize
    @gates = []
  end

  def instruct(plane)
    gates << plane
    report(plane)
  end

  def report(plane)
    "#{plane} has landed successfully."
  end
end
