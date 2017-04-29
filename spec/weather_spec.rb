require 'weather'
include Weather

describe '#weather' do
  it 'Usually sets weather as sunny but sometimes as stormy' do
    # Creates empty array in which we'll store the return values from running the method 100 times
    results = []
    # pushes those return values to the array
    100.times { results << weather_today }
    # Declares variables where we'll count how many stormy and sunny days our method just gave us
    sunny, stormy = 0, 0
    # Increments each counter according to how many of each type of day we have
    results.each { |weather| weather == "sunny" ? sunny += 1 : stormy += 1 }
    # Passes the test if the method produced more sunny than stormy days
    expect(sunny).to be > stormy
    p "In 100 days tested, there were #{sunny} sunny days and #{stormy} stormy ones"
  end
end
