require 'airport'

describe Plane do 

	subject(:plane) {Plane.new}
	let(:airport) {double :airport, planes: [subject]}

	it 'plane is inititalised as flying' do
		expect(subject.landed?).to eq false
	end	

	it 'expect plane status to change after landing' do
		subject.land
	    expect(subject.landed?).to eq true
	end

	it 'expect plane status to change after taking off' do
		subject.take_off
	    expect(subject.landed?).to eq false
	end
end
