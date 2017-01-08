require_relative 'airport'

class Plane

def initialize (status = "Airborne")
  @status = status
end

  def status?
    @status
  end

  def landed
    @status = "Plane landed."
  end

  def departed
    @status = "Plane departed."
  end

end
