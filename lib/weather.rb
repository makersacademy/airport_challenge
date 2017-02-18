require 'airport'

class Weather
attr_reader :safe

  def initialize
    @weathers = ["sunny", "stormy"]
  end

  def safe?
    if @weathers.sample == "sunny"
     @safe = true
    else
     @safe = false
    end
  end
end
