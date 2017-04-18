require 'airport'

describe Airport do 
	subject(:airport) { described_class.new }

	it { is_expected.to respond_to(:land).with(1).argument }

	describe '#land' do
		it 'returns plane' do
	  		plane = Plane.new
	  		expect(subject.land(plane)).to include plane
    	end
	end
end
