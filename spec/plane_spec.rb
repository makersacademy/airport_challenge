require 'plane'

describe Plane do

	subject(:plane) {described_class.new}

	describe '#land' do

		it "has landed" do
			plane.land
			expect(plane.landed?).to eq true
		end


	end

	describe '#take_off' do

		it "has taken_off" do
			plane.land
			plane.take_off
			expect(plane.landed?).to eq false
		end
		
	end

end