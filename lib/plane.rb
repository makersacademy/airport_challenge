class Plane
  attr_reader :name
  attr_accessor :currently_flying

  def initialize(name)
    @name = name
    @currently_flying = true
  end
end
