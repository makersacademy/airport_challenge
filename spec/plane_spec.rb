require 'plane'

describe Plane do
subject(:plane) { described_class.new }
let(:airport) { Airport.new(10) }
let(:landing) { plane.land(airport) }
let(:taking_off) { plane.take_off(airport) }
  context 'not stormy' do
    before do
      allow(airport).to receive(:storm?).and_return(false)
    end
    it 'lands' do
      landing
      expect(airport.planes).to eq [plane]
    end

    it 'takes off' do
      landing
      taking_off
      expect(airport.planes).to eq []
    end

    it 'raise an error when the plane has already landed' do
     landing
     expect { plane.land(airport) }.to raise_error("The plane has already landed")
    end

    it "raise an error if landing more planes than the airport's capacity" do
      10.times{ Plane.new.land(airport) }
      expect { landing }.to raise_error("The airport is full")
    end

    it 'raise an error if taking off already flying plane' do
      landing
      taking_off
      expect { plane.take_off(airport) }.to raise_error("The plane is not in this airport")
    end
  end

  context 'stormy' do
    before do
      allow(airport).to receive(:storm?).and_return(true)
    end
    it 'raise error when plane lands under a storm' do
      expect { landing }.to raise_error('The airport has a storm')
    end

    it 'raise an error when plane takes off under a storm' do
      expect { landing }.to raise_error('The airport has a storm')
    end
  end
end
