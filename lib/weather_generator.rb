class Weather

  attr_reader :forecast

  def generator
    @forecast = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy", "stormy"].sample
  end
end
