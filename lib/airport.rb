class Airport

  attr_accessor :weather, :full

  def initialize (weather = "sunny", full = false)
    @weather = weather
    @full = full
  end


end
