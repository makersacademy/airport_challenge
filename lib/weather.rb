class Weather

attr_reader :stormy

def initialize
  @stormy = false
end

def stormy?
  @stormy
end

def weather_setter
  if weather_setter_generator >= 9
        @stormy = true
      else
        @stormy = false
      end
end

  def weather_setter_generator
    rand(10)

  end


end