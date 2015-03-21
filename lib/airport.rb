class Airport
  attr_accessor :stationed_planes
  alias_method :arrival, :stationed_planes=
  def initialize(planes = nil)
    @stationed_planes = planes
  end
end
