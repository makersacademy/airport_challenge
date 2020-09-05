require 'weather'

describe Weather do
    condition = Weather.new
    it "responds to the method crap_weather?" do
        expect(condition).to respond_to :crap_weather? 
    end

end