class Weather

attr_accessor :weather_status

  def initialize
      if rand(2)==1
        @weather_status = "stormy"
      else
        @weather_status = "balmy"
      end
  end

end
