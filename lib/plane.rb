require_relative 'airport'
class Plane

  def initialize(name = 'Test', flying = false)
    @name = name
    @flying = flying
  end

  def flying?
    @flying == true
  end

  def change_status
    @flying = !@flying
  end

end
