class Weather
def stormy?
['sunny','sunny','sunny','sunny','sunny','stormy','sunny','sunny','sunny','sunny','sunny','sunny','stormy'].shuffle.last == 'stormy' ? true : false
end
end
