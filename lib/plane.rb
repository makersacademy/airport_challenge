class Plane

  def initialize
    @flying = true
  end

  def flying?
    flying
  end

  def landed?
    not flying
  end

  private

  attr_reader :flying
  
end
