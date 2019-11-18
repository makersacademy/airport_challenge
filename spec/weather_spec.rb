require 'spec_helper'
require 'weather'

describe Weather do 

  let(:weather) { Weather.new }

  describe '#stormy?' do 
	
	  it "sets the weather to stormy or not" do
		  expect(weather.stormy?).to be(true).or be(false)
	  end 
	
	end
end 
