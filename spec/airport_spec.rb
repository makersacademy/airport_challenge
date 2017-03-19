require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe "#initialize" do

    it 'checks default maximum capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'checks default capacity can be changed' do
      subject = Airport.new(50)
      expect(subject.capacity).to eq 50
    end
  end

  describe "#land" do

    it 'responds to land' do
      expect(subject).to respond_to :land
    end

    it 'land takes 1 argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'lands a plane' do
      plane = double(:plane, flying?: true)
      allow(plane).to receive(:land)
      allow(subject.weather).to receive(:stormy?) {false}
      expect(subject.land(plane)).to eq [plane]
    end

    it 'airport has the plane after landing' do
      plane = double(:plane, flying?: true)
      allow(plane).to receive(:land)
      allow(subject.weather).to receive(:stormy?) {false}
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'error raised if landing a plane when airport is full' do
      plane = double(:plane, flying?: true)
      allow(plane).to receive(:land)
      allow(subject.weather).to receive(:stormy?) {false}
      subject.capacity.times {subject.land(plane)}
      expect{subject.land(plane)}.to raise_error("Airport Full")
    end

    it 'error raised if landing a plane that is not flying' do
      plane = double(:plane, flying?: false)
      expect{subject.land(plane)}.to raise_error("Plane already landed")
    end

    it 'error raised if landing a plane in stormy conditions' do
      plane = double(:plane, flying?: true)
      allow(subject.weather).to receive(:stormy?) {true}
      expect{subject.land(plane)}.to raise_error("Weather Warning, can't land plane")
    end
  end

  describe "#take_off" do

    it 'responds to take_off' do
      expect(subject).to respond_to :take_off
    end

    it 'take_off takes 1 argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'airport no longer has the plane after taking off' do
      plane = double(:plane, flying?: true)
      allow(plane).to receive(:land)
      allow(subject.weather).to receive(:stormy?) {false}
      subject.land(plane)
      allow(plane).to receive(:flying?) {false}
      allow(plane).to receive(:take_off)
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end

    it 'error raised if a plane takes off in stormy conditions' do
      plane = double(:plane, flying?: false)
      subject.planes << plane
      allow(plane).to receive(:take_off)
      allow(subject.weather).to receive(:stormy?) {true}
      expect{subject.take_off(plane)}.to raise_error("Weather Warning, can't take off")
    end
  end
end
