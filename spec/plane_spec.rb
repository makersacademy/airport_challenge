require 'plane.rb'

describe Plane do
	let(:airport) { double(:landed_planes => [], :weather => "", :capacity => 20) }

	it { is_expected.to respond_to(:land).with(1).argument }
	it { is_expected.to respond_to(:take_off) }

	describe '#land' do

		it 'updates the current_airport variable' do
			initial_airport = subject.current_airport
			subject.land(airport)
			expect(subject.current_airport).not_to eq initial_airport
		end

		it 'lands a plane' do
			initial_landed_planes = airport.landed_planes.count
			subject.land(airport)
			expect(airport.landed_planes.count).to be > initial_landed_planes
		end

		it 'prevents a plane from taking off when stormy' do
			expect(subject.land(double(:airport, :landed_planes => [], :weather => "stormy"))).to eq "Stormy weather. Unable to land."
		end

		it 'prevents landing when airport capacity is full' do
			20.times { subject.land(airport) }
			expect(subject.land(airport)).to eq "Unable to land. Airport full."
		end

	end

	describe '#take_off' do

		it 'updates the current_airport variable to nil' do
			subject.current_airport = airport
			subject.take_off
			expect(subject.current_airport).to eq nil
		end

		it 'makes sure a plane takes off' do
			subject.land(airport)
			initial_landed_planes = airport.landed_planes.count
			subject.take_off
			expect(airport.landed_planes.count).to be < initial_landed_planes
		end

		it 'prevents a plane from taking off if weather is stormy' do			
			subject.current_airport = (double(:airport, :landed_planes => [], :weather => "stormy"))
			expect(subject.take_off).to eq "Stormy weather. Unable to take off."
		end

	end

end