class Weather

  attr_reader :stormy

  def initialize
    @stormy = rand(6)
  end
end
