class Weather

  attr_accessor :weather

  def forecast
    prediction = rand(1..10)
    if prediction == 10
      puts "fine"
    else
      puts "stormy"
    end
  end

end
