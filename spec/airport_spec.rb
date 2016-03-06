require './docs/airport'

describe Airport do 
let(:plane) {double :plane}
let(:weather) {double :weather, :random_weather => "not stormy"}
let(:weather1) {double :weather, :random_weather => "Stormy"}

	it { is_expected.to respond_to :full?}
	it { is_expected.to respond_to :in_airport?}
	it { is_expected.to respond_to :airport_open?}

	it 'has a default capacity of 50' do
		expect(subject.capacity).to eq 50
	end

	it 'can have a different maximum capacity' do
		airport = Airport.new(30)
		expect(airport.capacity).to eq 30
	end

	it 'can store any number of planes below it\'s capacity' do 
		20.times {subject.storage << plane}
		expect(subject.storage.length).to eq 20
	end

	it 'returns full? as true, when storage has reached capacity' do
		50.times {subject.storage << plane }
		expect(subject.full?).to eq true
	end

	it 'can check if the plane is in a particular airport' do
		subject.storage << plane
		expect(subject.in_airport?(plane)).to eq true
	end

	it 'can check whether the airport is open' do
		expect(subject.airport_open?(weather)).to eq true
	end

	it 'can check whether the airport is closed' do
		expect(subject.airport_open?(weather1)).to eq false
	end

end