require 'plane'

describe Plane do

	let(:airport) { double(:airport, :landed_planes => []) }
	let(:weather) { double(:weather) }
	let(:stormy_weather) { double(:weather) }

	before(:each) {allow(airport).to receive(:full?).and_return(false)}
	before(:each) { allow(weather).to receive(:stormy?).and_return(false) }
	before(:each) { allow(stormy_weather).to receive(:stormy?).and_return(true) }

	it { is_expected.to respond_to(:land).with(2).argument }
	it { is_expected.to respond_to(:take_off).with(2).argument }

	describe '#land' do

		it "lands at an airport" do
			subject.take_off(airport, weather)
			subject.land(airport, weather)
			expect(subject).to be_landed
			expect(airport.landed_planes).to include(subject)
		end


		it 'raises an error when trying to land in stormy weather' do
	 		expect { subject.land(airport, stormy_weather) }.to raise_error 'Too stormy to land!'
	 	end

	 	it 'cannot land when airport is full', focus: :true do
	 		full_airport = double(:airport)
	 		allow(full_airport).to receive(:full?).and_return(true) 
	 		expect { subject.land(full_airport, weather) }.to raise_error "Airport is full!"
	 	end

	end

	describe '#take_off' do

	 	it 'takes off from an airport' do
	 		subject.land(airport, weather)
	 		subject.take_off(airport, weather)
	 		expect(subject).to_not be_landed
	 		expect(airport.landed_planes).to_not include(subject)
	 	end

	 	it 'raises an error when trying to take off in stormy weather' do
	 		expect { subject.take_off(airport, stormy_weather) }.to raise_error 'Too stormy to take off!'
	 	end
	 	
	end

end


	