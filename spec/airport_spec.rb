require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {Airport.new}
  let(:plane) { double :plane, status: 'landed' }

  context 'landing' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has the plane after landing' do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect(airport.plane_counter).to eq(1)
      airport.land(plane)
      expect(airport.plane_counter).to eq(2)
    end

    it "should raise an error when weather stormy" do
      allow(airport).to receive(:stormy?).and_return true
      expect{subject.land(plane)}.to raise_error 'Weather is too dangerous for take off.'
    end

    it "should raise an error when airport capacity is full" do
      allow(plane).to receive(:land)
      allow(airport).to receive(:stormy?).and_return false
      allow(airport).to receive(:capacity_full?).and_return true
      expect{subject.land(plane)}.to raise_error 'Airport capacity is full.'
    end
  end

  context 'take off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'does not have the plane after landing' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      airport.land(plane)
      expect(airport.plane_counter).to eq(1)
      airport.take_off(plane)
      expect(airport.plane_counter).to eq(0)
    end

    it "should raise an error when weather stormy" do
      allow(airport).to receive(:stormy?).and_return true
      expect{subject.take_off(plane)}.to raise_error 'Weather is too dangerous for take off.'
    end
  end
end
