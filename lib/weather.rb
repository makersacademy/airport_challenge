
class Weather

  def initialize
    @stormy = set_weather
  end

  private

    def set_weather
      num = rand(20)
      true if num == 10
    end

end
