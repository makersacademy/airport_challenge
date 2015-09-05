require 'plane'

describe Plane do
	describe 'method:new/initialize' do
	  it 'is flying when created' do 
	  	expect(subject.flying).to eq(true)
	  end
	end
	describe 'method:flying?' do
		it {expect(subject).to respond_to(:flying).with(0).argument}
	end
	describe 'method:current_airport' do
		it {expect(subject).to respond_to(:current_airport).with(0).argument}
	end
	describe 'method:land' do
		it 'can land at a specified Airport' do
	  	expect(subject).to respond_to(:land).with(1).argument
	  end
	  it 'raises error when not given a valid airport object as destination' do
  	 	class Airport; end
  	 	airport = double(:airport_object)
 	  	allow(airport).to receive(:is_a?).with(Airport).and_return(false)
			expect{subject.land(airport)}.to raise_error 'Not an airport'
	  end
	  it 'raises error permission to land is not granted' do
  	 	class Airport; end
  	 	airport = double(:airport_object)
 	  	allow(airport).to receive(:is_a?).with(Airport).and_return(true)
			allow(airport).to receive(:land_permission).and_raise("Stormy weather")
			expect{subject.land(airport)}.to raise_error "Stormy weather"
	  end
	end
end
