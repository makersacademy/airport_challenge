class Weather
  STORMY_NUMBERS = [0]
  def stormy?
    random_number = rand(3)

    puts "DEBUG-TEXT: stormy if random_number == 0"
    puts "DEBUG-TEXT: random_number is #{random_number}"    

    STORMY_NUMBERS.include?(random_number) ? true : false
  end
end
