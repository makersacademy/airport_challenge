require 'airport.rb'
require 'plane.rb'

describe Airport do

  let(:airport) { Airport.new(capacity: 10) }
  let(:plane) { double :plane }

  describe ".stormy?" do
    it 'checks if method in module is recognised' do
      expect(subject).to respond_to :stormy?
    end
  end

  describe ".planes_in_airport" do
    it 'shows planes that are in the airport' do
      expect(subject).to respond_to :planes_in_airport
    end
  end

  describe ".full?" do
    it 'shows that the airport is at full capacity' do
      expect(subject).to respond_to :full?
    end
  end

  context 'landing' do

    describe ".land" do
      it "raises an error if weather is stormy" do
        allow(airport).to receive(:stormy?).and_return(true)
        expect { subject.land(plane) }.to raise_error "There's a storm"
      end

      it "raises an error if the airport is full" do
        allow(plane).to receive(:landing).with(airport)
        10.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "Airport full"
      end

      it "lands a plane at the airport" do
        expect(subject).to respond_to :land

        expect(subject.land(plane)).equal? plane
      end
    end
  end

  context 'taking off' do

    describe ".takeoff" do

      it "raises an error if weather is stormy" do
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.takeoff(plane) }.to raise_error "There's a storm"
      end

      it "allows a plane to takeoff from the airport" do
        expect(subject).to respond_to :takeoff

        expect(airport.takeoff(plane)).equal? plane
      end
    end
  end
end
