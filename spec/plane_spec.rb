require 'plane'

describe Plane do

	subject(:plane) { described_class.new }

	before(:each) do
		@error1 = 'Plane already landed!'
		@error2 = 'Plane already in the air!'
	end

	describe '#land' do

		it 'stops flying after landing' do
			plane.land
			expect(plane).to_not be_flying
		end

		it 'cannot land if already landed' do
			plane.land
			expect { plane.land }.to raise_error { @error1 }
		end

		it 'can land if not already landed' do
			plane.take_off
			expect { plane.land }.to_not raise_error 
		end

	end

	describe '#take_off' do

		it 'starts flying after taking off' do
			plane.take_off
			expect(plane).to be_flying
		end

		it 'cannot take off if already flying' do
			plane.take_off
			expect { plane.take_off }.to raise_error { @error2 }
		end

		it 'can take off if not already flying' do
			expect { plane.take_off }.to_not raise_error
		end

	end

end


	