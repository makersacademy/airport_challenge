class Weather

  attr_reader :stormy

  def initialize
    @stormy = (rand(3) == 1 ? true : false)
  end

end
