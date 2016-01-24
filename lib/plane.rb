
class Plane

  def initialize
    @flying = true
  end

  def land
    fail 'plane already landed' if landed?
    @flying = false
  end

  def fly
    fail 'plane already flying' if flying?
    @flying = true
  end

  private

  attr_reader :flying

  def flying?
    flying == true
  end

  def landed?
    flying == false
  end

end
