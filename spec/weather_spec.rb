require 'weather'

describe Weather do
	 subject(:weather) { described_class.new }
	
	 describe 'attributes' do

 		 it { is_expected.to respond_to :at_the_moment }
 		 it { is_expected.to respond_to :at_the_moment= }

 		 it 'allows for reading and writing for weather :at_the_moment' do
    		weather.at_the_moment = 'sunny'
    		expect(weather.at_the_moment).to eq('sunny')
    end

 	# As an air traffic controller 
 	# To ensure safety
 	# I want to prevent landing when weather is stormy

 	# You will need to use a random number generator to
 	# set the weather (it is normally sunny but on rare 
 	# occasions it may be stormy). In your tests, you'll 
 	# need to use a stub to override random weather to
 	# ensure consistent test behaviour.
 	end

end
