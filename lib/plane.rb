class Plane
  attr_reader :flying
  alias_method :flying?, :flying


  def initialize
    @flying = true
  end
end
