class GoodWeatherStub

  def initialize
    @random = 1
  end

  def conditions
    return :good if @random> 0.3
      :stormy
    end
end

class BadWeatherStub

  def initialize(random = rand)
    @random = 0
  end

  def conditions
    return :good if @random> 0.3
      :stormy
    end
end
