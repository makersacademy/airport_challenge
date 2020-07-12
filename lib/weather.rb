class Weather

  attr_reader :forecast

  def initialize
    @forecast = (1..5).to_a.sample == 1 ? "stormy" : "sunny"
  end

end
