class Weather

attr_accessor :weather
  def initialize
    @weather = ["sunny", "stormy", "sunny"].sample
  end

end
