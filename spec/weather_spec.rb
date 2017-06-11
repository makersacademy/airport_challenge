require 'weather'

describe Weather do

	it { is_expected.to respond_to(:weather) }

	it "is expected to be initialized with an admissible value" do
		condition = Weather.new
		expect(condition.weather).to eq("Sunny").or eq("Stormy")
	end 

	# describe "#sunny?" do 
	# 	it "confirms that the weather is sunny" do
	# 		weather = Weather.new
	# 		weather.condition = "Sunny"
	# 		expect(weather.sunny?).to eq true                                                                                   
	# 	end 
	# end 

	# describe "#stormy?" do
	# 	it "confirms that the weather is stormy" do 
	# 		weather = Weather.new
	# 		weather.condition = "Stormy"
	# 		expect(weather.stormy?).to eq true
	# 	end 
	# end 
end 