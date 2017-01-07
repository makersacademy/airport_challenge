require 'airport'

describe Airport do

	describe '#land' do
		it {is_expected.to respond_to(:land).with(1).argument}
		it 'should return plane is landed' do
			plane = Plane.new	
			expect{subject.land(plane).to eq true}
			end

		it 'should return plane is not landed if weather is stormy' do
			plane = Plane.new	
			bad_weather = 60
			expect{subject.land(plane)}.to raise_error('Weather is stormy, cannot land')
			end

	end

	describe '#take_off' do
		it {is_expected.to respond_to(:take_off).with(1).argument}
		it 'should return plane is taken off if weather is sunny' do
			plane = Plane.new	
			bad_weather = 40	
			expect{subject.take_off(plane).to eq false}
			end	
	
		it 'should return plane is not taken off if weather is stormy' do
			plane = Plane.new	
			bad_weather = 60
			expect{subject.take_off(plane)}.to raise_error('Weather is stormy, cannot take off')
			end

	end

end