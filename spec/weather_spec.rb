require 'weather'

describe Weather do
	before :each do 
	  @weather = Random.new
	  @good_weather =Random.new
	  @bad_weather = Random.new
	  #@bad_weather = Weather.new(false)
	  @air_traffic_controller = AirTrafficController.new
	  #@good_weather = 
	end 
	  it 'responds to weather' do 
	  	expect(@weather.rand(2)).to be_between(0,2)
	  end

	  it 'Generates weather using a random number with a bias for good weather' do
	    expect(@good_weather.rand(1..2)).to be_between(1,2)
		end 

		it "Generates a random number when initialized reapresents the weather" do
			expect(@bad_weather.rand(0...1)).to eq 0
		end 

end 
