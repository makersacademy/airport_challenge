
class Weather

  attr_reader :stormy

  def initialize
    @stormy = set_weather
  end

  private

    def set_weather
      num = rand(3)
      true if num == 2
    end

end
