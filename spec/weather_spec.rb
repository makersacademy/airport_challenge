require 'spec_helper'
require 'weather'

describe Weather do 

  let(:weather) { Weather.new }

  describe '#stormy?' do 
	
	   it "randomly sets the weather to stormy" do
		    allow(weather).to receive(:stormy?).and_return(true)
      expect(weather.stormy?).to eq(true)
	   end 
		
	   it "randomly sets the weather to not stormy" do
		    allow(weather).to receive(:stormy?).and_return(false)
	     expect(weather.stormy?).to eq(false)
	   end
  end
end 
