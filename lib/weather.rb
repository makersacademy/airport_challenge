class Weather
  attr_reader :stormy

  def initialize
    @stormy = stormy_decision_maker
  end

  def stormy?
    @stormy
  end

  def stormy_decision_maker
    if chance <= 2
      true
    else
      false
    end
  end

  def chance
    rand(10)
  end
end
