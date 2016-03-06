class Weather

  private

  def roll_new_weather
    srand
    @current = case rand(1..10)
    when 1..7 then :sunny
    when 8..10 then :stormy
    end
  end

  public

  def initialize
    @current = roll_new_weather
  end

  def current_weather
    @current
  end

  def change_weather new_weather = nil
    @current = new_weather || roll_new_weather
  end

end
