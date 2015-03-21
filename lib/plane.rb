class Plane
  attr_reader :status
  # because I realised that attr_reader doesn't like :status?
  # thanks to google I found the following solution
  alias_method :status?, :status
  def initialize
    @status = 'flying'
  end

  def take_off!
    @status = 'flying'
  end

  def landed!
    @status = 'landed'
  end
end
