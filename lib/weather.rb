class Weather

  attr_reader :stormy

  def initialize
    @stormy = rand(1..4) == 1 # 25%
  end

end
