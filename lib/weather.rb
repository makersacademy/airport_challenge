class Weather
  def stormy? 
    rand(5) == 4 # as it's stormy in rare cases, stormy? will only return true if rand(5) generates 4 i.e. probably 4 in 5. 
  end
end

# p weathertest = Weather.new
# p weathertest.stormy?