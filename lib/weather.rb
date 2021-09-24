# This randomly decides whether it is storm (20%) or clear (80%)
# weather conditions.

def storm_check
    forecast = rand(6)
    if forecast == 5
        return 0
    else
        return 1
    end
end

storm_check


