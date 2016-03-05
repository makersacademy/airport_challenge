class Weather

  private

  @current = :sunny

  def self.roll_new_weather
    srand
    case rand(1..10)
    when 1..7 then :sunny
    when 8..10 then :stormy
    end
  end

  public
  
  def self.show_weather
    @current
  end

  def self.change_weather(new_weather=nil)
    @current = new_weather || self.roll_new_weather
  end

end
