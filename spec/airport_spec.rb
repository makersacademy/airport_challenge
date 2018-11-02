require 'airport'
require 'plane'

describe Airport do
  let(:weather) { double :weather }
  let(:plane) { double :plane }
  it 'should land a plane' do
    expect(subject.land(plane)).to include plane
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
