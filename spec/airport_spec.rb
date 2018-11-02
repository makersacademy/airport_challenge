require 'airport'
require 'plane'

describe Airport do
  let(:weather) { double :weather }
  let(:plane) { double :plane }
  describe '#land' do
    context "when not stormy" do
      it 'should land a plane' do
        allow(weather).to receive(:stormy?).and_return false
        airport = Airport.new(weather)
        expect(airport.land(plane)).to include plane
      end
    end
    context "when stormy" do
      it 'should not land a plane' do
        allow(weather).to receive(:stormy?).and_return true
        airport = Airport.new(weather)
        expect{ airport.land(plane) }.to raise_error 'it is too stormy to land'
      end
    end
  end
  describe '#takeoff' do
    context "when not stormy" do
      it 'should take off a plane' do
        allow(weather).to receive(:stormy?).and_return false
        airport = Airport.new(weather)
        expect(airport.takeoff(plane)).to eq "#{plane} has taken off"
      end
    end
    context "when stormy" do
      it 'should prevent take off' do
        allow(weather).to receive(:stormy?).and_return true
        airport = Airport.new(weather)
        expect{ airport.takeoff(plane) }.to raise_error 'it is too stormy to take off'
      end
    end
  end
end

describe Weather do
  describe '#stormy?' do
    it 'should return true or false' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
  end
end
