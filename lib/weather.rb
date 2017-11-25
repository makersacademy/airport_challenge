class Weather
  attr_reader :state

  def initialize
    @state = [*1..100].sample
  end

  def stormy?
    if state > 90
      true
    else
      false
    end
  end
end
