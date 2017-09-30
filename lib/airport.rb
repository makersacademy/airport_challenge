class Airport

attr_reader :planes

  def initialize(planes = [])
    @planes = planes
  end
end
