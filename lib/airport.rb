class Airport
  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = ['Stormy','Sunny','Cloudy','Rainy','Snowy'].sample
  end

end
