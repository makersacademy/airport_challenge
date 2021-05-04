class Weather

attr_accessor :status, :random_number

  def random_number_method
  @random_number = rand(1..20)
  end

  def random_weather
   random_number_method
   if @random_number == 1 
    @status = "stormy"
   else
    @status = "sunny"
   end
  end

end 
