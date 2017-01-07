require 'airport'

describe Airport do
	describe '#land' do
	it {is_expected.to respond_to(:land).with(1).argument}
	it 'should return plane is landed' do
		plane = Plane.new	
		expect{subject.land(plane).to eq true}
		end	
	end

	describe '#take_off' do
	it {is_expected.to respond_to(:take_off).with(1).argument}
	it 'should return plane is taken off' do
		plane = Plane.new	
		expect{subject.land(plane).to eq false}
		end	
	end

end