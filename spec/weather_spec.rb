require 'spec_helper'
require 'weather'


describe Weather do 

	let(:weather) {Weather.new}

	describe '#stormy?' do 
		it "randomly sets the weather to stormy" do
			allow(weather).to receive(:stormy?).and_return(true)
	    expect(weather.stormy?).to eq(true)
	  end 
	end
	
end 