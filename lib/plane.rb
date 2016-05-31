class Plane
  def initialize
    @flying = true
  end

  def flight_start
    self.flying = true
  end

  def flight_end
    self.flying = false
  end

  def flying?
    flying
  end

  private

    attr_accessor :flying
end
