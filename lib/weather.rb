class Weather
  attr_accessor :condition

  def initialize(condition = rand(50..100))
    @condition = condition
  end

end


#allow(Kernel).to receive(:rand).and_return(4)
