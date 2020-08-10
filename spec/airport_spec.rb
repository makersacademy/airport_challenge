require 'airport'

describe Airport do

	it { is_expected.to respond_to(:land).with(1).argument }

	it { is_expected.to respond_to(:take_off) }

	it 'capacity has been set' do
		expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
	end

	describe 'land' do

		it 'land a plane' do
		  plane = Plane.new
		  allow(subject).to receive(:stormy?) { false }
		  expect(subject.land(plane)).to eq [plane]
		end

		it 'prevention of landing if Airport full' do
			allow(subject).to receive(:stormy?) { false }
			30.times { subject.land(Plane.new) }
			expect { subject.land Plane.new }.to raise_error 'Airport Full'
		end

    it 'error if plane attempting to land during "stormy" conditions' do
  	  allow(subject).to receive(:stormy?) { true }
      expect { subject.land Plane.new }.to raise_error "Weather is stormy"
    end
  end

	describe 'take_off' do

		it 'plane has left the airport' do
			plane = Plane.new
			subject.land(plane)
			expect(subject.take_off).to eq plane
		end

		it 'raises error if no planes available' do
			plane = Plane.new
			expect { subject.take_off }.to raise_error('No planes available')
		end

		it 'take off raises an error if stormy' do
			plane = Plane.new
			subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off }.to raise_error "Weather is stormy"
    end

	end
end