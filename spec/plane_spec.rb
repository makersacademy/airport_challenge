require 'plane'

describe Plane do
	subject(:plane) { described_class.new }

	it 'the plane has a default flight status' do
		expect(plane.flying).to eq(Plane::DEFAULT_FLIGHT_STATUS)
	end

	describe 'attributes' do
		it { is_expected.to respond_to :flying }
		it { is_expected.to respond_to :flying= }

		it 'allows for reading and writing for :flying' do
			plane.flying = false
			expect(plane.flying).to eq(false)
		end	 
	end

end
