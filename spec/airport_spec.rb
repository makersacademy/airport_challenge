
require 'airport'

describe Airport do

	subject(:airport){ described_class.new }     
																						
	it { is_expected.to respond_to :land }

	it 'confirmation plane landed' do
		expect(subject.land Plane.new).to eq "Plane has landed"
	end

	it { is_expected.to respond_to :take_off }

	it 'plane not longer at the airport after take off' do
		expect(subject.take_off).to eq nil
	end
end