require 'plane.rb'

describe Plane do
	it { is_expected.to respond_to(:land).with(1).argument }
	it { is_expected.to respond_to(:take_off) }

	describe '#land' do

		let(:airport) { double(:airport, :landed_planes => []) }

		it 'lands a plane' do
			initial_landed_planes = airport.landed_planes.count
			subject.land(airport)
			expect(airport.landed_planes.count).to be > initial_landed_planes
		end

	end



end