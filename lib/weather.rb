
class Weather

  attr_reader :weather

  def stormy?
    num = rand(1..10)
    if num >= 5
      @weather = true
    elsif num <= 5
      @weather = false
    end
  end

end
