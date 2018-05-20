require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

	describe '#land' do
		it 'Contains the airport its at' do
			plane.land(airport)
			expect(plane.airport).to eq airport
		end
	end
	
	describe '#depart' do
		it 'Plane doesnt have an airport' do
			plane.land(airport)
			plane.depart
			expect(plane.airport).to eq nil
		end
	end
end
