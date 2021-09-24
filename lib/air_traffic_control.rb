require 'weather' # rspec doesn't like this being called ./weather, but the IDE does
require 'system_designer' # rspec doesn't like this being called ./system_designer, but the IDE does
require 'outputs'

class AirTrafficControl

  def initialize(capacity)
    designer = SystemDesigner.new
    weather = Weather.new

    @airport_capacity = designer.default_capacity(capacity)
    weather.random_weather

  end

  def airport_capacity
    @airport_capacity
  end

end

outputs = Outputs.new
outputs.output
