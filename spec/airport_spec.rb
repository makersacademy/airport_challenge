require 'airport'

describe Airport do

  it { is_expected.to respond_to(:plane_land).with(1).argument }

  it { is_expected.to respond_to(:plane_takeoff) }

  describe 'Landing' do

  it 'lands plane' do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane)
      subject.plane_land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'confirms plane has landed' do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.plane_land(double(:plane))).to eq "A plane has landed"
    end
  end

  describe 'Takeoff' do

    it 'plane takes off' do
      allow(subject).to receive(:stormy?) { false }
      subject.plane_land(double(:plane))
      subject.plane_takeoff
      expect(subject.planes).to eq []
    end

    it 'confirms plane has taken off' do
      allow(subject).to receive(:stormy?) { false }
      subject.plane_land(double(:plane))
      expect(subject.plane_takeoff).to eq "Plane has taken off"
    end
  end

  describe 'Stormy' do

    it 'raises an error on takeoff, if weather is stormy' do
      allow(subject).to receive(:stormy?) { false }
      subject.plane_land(double(:plane))
      allow(subject).to receive(:stormy?) { true }
      expect { subject.plane_takeoff }.to raise_error
    end

    it 'raises an error when trying to land, if weather is stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.plane_land(double(:plane)) }.to raise_error
    end
  end

  describe 'Capacity' do

    it 'prevents planes from landing, if airport is full' do
      airport = Airport.new
      100.times do
        allow(airport).to receive(:stormy?) { false }
        airport.plane_land(double(:plane))
      end
      allow(airport).to receive(:stormy?) { false }
      expect { airport.plane_land(double(:plane)) }.to raise_error
    end

    it 'lets user set airport capacity' do
      airport = Airport.new(3)
      3.times do
        allow(airport).to receive(:stormy?) { false }
        airport.plane_land(double(:plane))
      end
      allow(airport).to receive(:stormy?) { false }
      expect { airport.plane_land(double(:plane)) }.to raise_error
    end
  end




end
