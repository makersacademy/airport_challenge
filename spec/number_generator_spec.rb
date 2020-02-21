require 'number_generator'

describe NumberGenerator do 
	it "returns a random weather condition" do
		number_generator = NumberGenerator.new
		weather = number_generator.weather
		expect(weather.include? number_generator.biubiubiu).to be true
	end
end