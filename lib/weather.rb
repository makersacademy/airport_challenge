class Weather
#attr_accessor :stormy
# def initialize
#   @stormy = stormy?
# end

  def stormy? #random number generator to decide weather
    Kernel.rand(1..6) == 1 #stormy sets to true on 1/6.
  end

end
