class Plane
  attr_reader :status
  # because I realised that attr_reader doesn't like :status?
  # thanks to google I found the following solution
  alias_method :status?, :status
  def initialize
    @status = 'flying'
  end

  def take_off!
    # use fail instead of raise to signal exception. In the tutorial with
    # Stephen and Mihail it seems that fail worked. Why?
    fail 'This plane is already flying' if @status == 'flying'
    @status = 'flying'
  end

  def landed!
    @status = 'landed'
  end
end
