class Weather

  attr_reader :stormy

  def initialize
    @stormy = rand(20) == 20 ? true : false
  end

end
