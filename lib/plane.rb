class Plane
  attr_reader :flying
  # because I realised that attr_reader doesn't like :flying?
  # thanks to google I found the following solution
  alias_method :flying?, :flying
  def initialize
    @flying = true
  end

  def take_off!
    @flying = false
  end
end
