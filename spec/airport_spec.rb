
require 'Airport'
require 'plane'

describe Airport do
	let(:plane) {Plane.new}
	it 'responds to land with 1 argument' do
	subject { is_expected.to respond_to(:land).with(1).argument }
	end

	it 'says that it has landed' do 
	expect(subject.land(plane)).to eq true
	end

end
	