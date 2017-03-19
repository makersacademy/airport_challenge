class Weather

# change to random sunny or stormy generator later
  def stormy?
    num = rand(10)
    @stormy = num.even? ? true : false
  end

end
