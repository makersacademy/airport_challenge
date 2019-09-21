class Airport

  attr_accessor :planes, :weather

  def initialize
    @planes = []
    @weather = ["sunny", "stormy"].sample
  end

end
