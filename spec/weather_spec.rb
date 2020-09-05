require "weather"

describe Weather do
	
	describe "#stormy" do
	
	it "allows for the wather to be not stormy" do 
		weather = Weather.new 
		expect(weather.stormy?).to be false
	end

	it "allows for the weather to be stormy" do 
		weather = Weather.new 
		expect(weather.stormy?).to be true 
	end 

end 
end