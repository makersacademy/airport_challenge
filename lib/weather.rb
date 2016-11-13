class Weather

#attr_accessor :calm_or_stormy

#def initialize(calm_or_stormy = "calm")
#@calm_or_stormy = calm_or_stormy
#end

def report
weather_number = 1 + rand(10)
if weather_number == 10
  "stormy"
else
  "calm"
end
end

def stormy #to test the effects of stormy
    "stormy"
end

def calm #to test the effects of calm
    "calm"
end


end
