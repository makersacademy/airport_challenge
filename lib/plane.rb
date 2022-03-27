class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def flying?
    @flying == true ? true : false
  end
end