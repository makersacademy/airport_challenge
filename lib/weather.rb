# Creates a probalistic weather model for use with associated airport model.
class Weather
  def check_safe?
     Kernel.rand(1..10) > 2
  end
end
