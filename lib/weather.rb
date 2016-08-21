# Creates a probalistic weather model for use with associated airport model.
class Weather
  def initialize(unsafe_prob = 2)
    @unsafe_prob  = unsafe_prob
  end
  def check_safe?
     Kernel.rand(1..10) > @unsafe_prob
  end
end
