class Weather

attr_reader :stormy

def initialize
  @stormy = false
end

  def stormy?
    @stormy
  end



  def weather_setter_generator
    storm = rand(10)
      if storm >= 9
        @stormy = true
      else
        @stormy = false
      end

  end


end