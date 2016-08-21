# Creates a probalistic weather model for use with associated airport model.
class Weather
UNSAFE = 2
  def check_safe?
     Kernel.rand(1..10) > UNSAFE
  end
end
