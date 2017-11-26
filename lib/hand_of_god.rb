module Weather

    CHANCES_OF_GOOD_WEATHER = 50

    def stormy?
      rand(1..101) > CHANCES_OF_GOOD_WEATHER
    end

end
