require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { double(:plane, take_off: nil, land: nil) }
  let(:weather) { double(:weather, stormy?: false) }
  subject(:airport) { described_class.new weather }

  it 'has a default capacity' do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  describe "#land" do
    before do
      allow(plane).to receive(:land)
    end

    it 'lands a plane in the airport' do
      subject.land(plane)
    end

    it 'has the plane after it has landed' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'does not allow plane already landed to land again' do
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error "Plane has already landed in the airport"
    end

    it 'raise an error when the airport is full' do
      allow(weather).to receive(:stormy?).and_return(false)
      subject.capacity.times do
        plane = double(:plane)
        allow(plane).to receive(:land).and_return(false)
        subject.land(plane)
      end
      expect{subject.land(plane)}.to raise_error "Airport full"
    end

    it 'will prevent landing when the weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect{subject.land(plane)}.to raise_error "It is too stormy to land"
    end
  end

  describe "#take_off" do
    before do
      allow(plane).to receive(:land).and_return(false)
      allow(plane).to receive(:take_off).and_return(true)
    end

    it 'instructs the plane to take off' do
      allow(weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      subject.take_off(plane)
    end

    it 'confirms that the plane taken off is no longer at the airport' do
      allow(weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

    it 'can only allow planes already landed to take off' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect{subject.take_off(plane)}.to raise_error "Plane can't take off if it has not landed at the airport"
    end

    it 'will prevent taking off when the weather is stormy' do
      allow(plane).to receive(:land)
      subject.land(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect{subject.take_off(plane)}.to raise_error "It is too stormy to take off"
    end
  end
end
