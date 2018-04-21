class PlaneError < StandardError
  def initialize(msg="Plane Error cannot perform command")
  super
  end
end
