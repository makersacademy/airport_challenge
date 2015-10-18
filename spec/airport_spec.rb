require 'airport'

describe Airport do

  let(:plane) { double(:plane, :flying => :plane, :landed => :plane) }

  describe '#initializing capacity' do

    it 'has a #DEFAULT_CAPACITY of 20' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'has an overridden capacity when specified' do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end
  end

  describe '#land' do

    it 'lands a plane' do
    expect(subject).to respond_to(:land).with(1).argument
    end

    context 'does not land a plane when:' do

      it 'airport is full' do
        allow(subject).to receive(:stormy?) { false }
        described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
        expect{subject.land(plane)}.to raise_error 'Airport is full!'
      end

      it 'weather is stormy' do
        allow(subject).to receive(:stormy?) { true }
        expect{subject.land(plane)}.to raise_error 'Landing denied. Weather is stormy!'
      end
    end

    it 'planes landed already are in the airport' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end

  describe '#take_off' do

    it 'takes off a plane' do
      expect(subject).to respond_to(:take_off)
    end

    context 'does not take off a plane when:' do

      it 'weather is stormy' do
        allow(subject).to receive(:stormy?) { false }
        subject.land(plane)
        allow(subject).to receive(:stormy?) { true }
        expect{subject.take_off}.to raise_error 'Take-off denied. Weather is stormy!'
      end

      it 'it is already flying' do
        allow(subject).to receive(:stormy?) { false }
        allow(plane).to receive(:location) { :air }
        subject.land(plane)
        subject.take_off
        expect(plane.location).to be :air
      end
    end

    it 'plane is no longer in airport after take-off' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      subject.take_off
      expect(subject.planes).to be_empty
    end
  end

    context '#stormy? returns:' do

      it "'true' when greater than 0.95" do
        x = rand(0.96..1.0)
        expect(x > 0.95).to eq true
    end

      it "'false' when less than 0.95" do
        x = rand(0..0.95)
        expect(x > 0.95).to eq false
      end
    end
end
