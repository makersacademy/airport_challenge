require 'plane'

describe Plane do

	subject(:plane) { described_class.new }

	it { is_expected.to have_attributes(flying: false) }

	context 'landing' do

		it 'stops flying after landing' do
			plane.flying = true
			plane.land
			expect(plane).to_not be_flying
		end

	end

	context 'taking off' do
		it 'starts flying after taking off' do
			plane.take_off
			expect(plane).to be_flying
		end
	end
	
end


	