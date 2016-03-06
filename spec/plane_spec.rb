require 'plane'

describe Plane do 

	let(:plane) {double :plane, :landed? => true}
	let(:airport) {double :airport, :planes => [subject]}

	it 'plane is flying' do
	expect(subject.landed?).to eq false
	end	

	it 'plane has landed' do
	expect(plane.landed?).to eq true
	end


end
