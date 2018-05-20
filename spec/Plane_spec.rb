
require 'Plane'
describe Plane do
	let(:airport) {double :airport}
	it '#land' do
		expect(subject).to respond_to(:land)
		#act
		subject.land(airport)
		#assert
		expect(subject.landed_at).to eq airport
		expect(subject.state).to eq 'landed'

	end

	it '#take_off' do
		expect(subject).to respond_to(:take_off)
		#act
		subject.take_off
		#assert
		expect(subject.landed_at).to eq nil
		expect(subject.state).to eq 'in_air'


	end

end