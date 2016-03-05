class Weather

  def initialize
    @current = :sunny
  end

  def show_weather
    @current
  end

  def change_weather(new_weather=nil)
    @current = new_weather || roll_new_weather
  end

  private

  def roll_new_weather
    srand
    case rand(1..10)
    when 1..7 then :sunny
    when 8..10 then :stormy
    end
  end

end
