class Weather

attr_reader :stormy

  def initialize
    @stormy = false

  end

  def stormy?

    @stormy
     #stormy = rand(1..30) == 1 ? true : false
     #return @stormy
  end

end
