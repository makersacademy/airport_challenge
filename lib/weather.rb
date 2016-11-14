class Weather

  def initialize(random = rand)
    @random = random
  end

  def conditions
    return :good if @random> 0.3
      :stormy
    end
end
