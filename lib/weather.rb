class Weather
    def stormy?
      rand(1..9).if_even
    end
  end