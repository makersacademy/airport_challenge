class Weather
  def initialize
    @random = rand(2)
  end

  def random
    @random
  end

  def current
    if @random == 0
      "good weather"
    else
      "bad weather"
    end
  end
end
