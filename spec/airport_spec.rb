require 'airport'
require 'plane'
require 'weather'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  describe '#Landing a plane' do
    let(:plane) { double :plane }

    it 'Should allow a plane to land' do
      allow(subject).to receive(:weather) { "sunny" }
      expect(subject.land(plane)).to eq [plane]
    end

    it 'raises an error when the weather is stormy' do
      allow(subject.weather).to receive(:stormy) { false }
      subject.land(plane)
      allow(subject.weather).to receive(:stormy) { true }
      expect { subject.land(Plane.new) }.to raise_error "Stormy weather"
    end

  end

  describe '#Taking off a plane' do
    let(:plane) { double :plane }

    it "Should allow a plane to take off" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
    it 'raises error when weather is stormy' do
      allow(subject.weather).to receive(:stormy) { true }
      subject.land(Plane.new)
      allow(subject.weather).to receive(:stormy) { true }
      expect { subject.take_off }.to raise_error "Stormy weather"
    end
  end

end
