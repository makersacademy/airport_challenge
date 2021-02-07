class Airport
  attr_reader :planes, :title

  def initialize(title = "Unnamed Airport", planes = [])
    @title = title
    @planes = planes
  end

  def weather
    if rand(1..10).between?(1,7)
      return "sunny"
    else
      return "stormy"
    end
  end

end
