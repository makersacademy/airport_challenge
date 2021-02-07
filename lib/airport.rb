class Airport
  attr_reader :planes, :title

  def initialize(title = "Unnamed Airport", planes = [])
    @title = title
    @planes = planes
  end

end
