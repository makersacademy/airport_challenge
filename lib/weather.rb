# Creates a probalistic weather model.
class Weather
UNSAFE_PROB = 2
  def check_safe?
     Kernel.rand(1..10) > UNSAFE_PROB
  end
end
