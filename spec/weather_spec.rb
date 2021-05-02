require './lib/weather.rb'

describe Weather do
    it 'provides random weather instances' do
        arr_of_sample_weather_status = []
        10.times {arr_of_sample_weather_status << Weather.new.status}
        expect(arr_of_sample_weather_status).to include "sunny" and "stormy"
    end
    # test fallability: it is possible that we won't get both sunny and stormy because of randoms
    # add a test to see if it gives sunny more often than stormy?

end
