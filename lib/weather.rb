def weather
    number = rand(6)
    if number == 1
        @weather = 'stormy'
    else
        @weather = 'clear'
    end
end