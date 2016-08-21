# Creates a probalistic weather model for use with associated airport model.
class Weather
  def initialize(unsafe_prop = 2)
    @unsafe_prop  = unsafe_prop
  end
  def check_safe?
     Kernel.rand(1..10) > @unsafe_prop
  end
end
