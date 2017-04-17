require 'airport'
require 'plane'

RSpec.describe Airport do
	subject(:airport) { described_class.new }
	let(:plane) { double :plane }
	let(:next_plane) { double :next_plane }

	it { is_expected.to respond_to :land }
	it { is_expected.to respond_to :take_off }

	describe '#land' do
		context 'when conditions are clear' do

			it 'instructs a plane to land' do
				allow_any_instance_of(Weather).to receive(:stormy?) { false }
				expect(plane).to receive(:landed)
				airport.land(plane)
			end

			it 'confirms the plane is in the airport' do
				allow_any_instance_of(Weather).to receive(:stormy?) { false }
				allow(plane).to receive(:landed)
				airport.land(plane)
				expect(airport.planes).to include plane
			end
		end
	end

	it 'prevents plane from landing if already in airport' do
		allow_any_instance_of(Weather).to receive(:stormy?) { false }
		airport = Airport.new
		plane = Plane.new
		airport.land(plane)
		expect { airport.land(plane) }.to raise_error 'This plane has already landed'
	end

	it 'prevents landing when airport is full' do
		allow_any_instance_of(Weather).to receive(:stormy?) { false }
		2.times { airport.land(Plane.new) }
		expect { airport.land(next_plane) }.to raise_error 'This airport is full'
	end
end

context 'when weather is stormy' do
	it 'prevents landing' do
		allow_any_instance_of(Weather).to receive(:stormy?) { true }
		error = 'Landing not permited due to poor weather conditions'
		expect { Airport.new.land(Plane.new) }.to raise_error error
	end

end

describe '#take_off' do
	context 'when conditions are clear' do
		before do
			allow(weather).to receive(:stormy?) { false }

			it 'instructs a plane to take off' do
				allow(plane).to receive(:landed)
				expect(plane).to receive(:take_off)
				airport.land(plane)
				airport.take_off(plane)
			end

			it 'confirms the plane is not in the airport' do
				allow(plane).to receive(:landed)
				allow(plane).to receive(:taken_off)
				airport.land(plane)
				airport.take_off(plane)
				expect(airport.planes).not_to include plane
			end

		end

	end

	context 'when conditions are poor' do
		it 'prevents take off' do
			airport = Airport.new
			plane = Plane.new
			allow_any_instance_of(Weather).to receive(:stormy?) { false }
			airport.land(plane)
			allow_any_instance_of(Weather).to receive(:stormy?) { true }
			error = 'Take off not permited due to poor weather conditions'
			expect { airport.take_off(plane) }.to raise_error error
		end
	end

end
