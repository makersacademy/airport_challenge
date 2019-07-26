class Airport
  attr_reader :planes
  def initialize
    @planes = 1
    @weather = "clear"
  end

  def land
    @planes += 1
  end

  def take_off
    if @weather == "stormy"
      raise "cannot take off while weather is #{@weather}"
    else
      @planes -= 1
    end
  end

  def weather(report)
    @weather = report
  end
end