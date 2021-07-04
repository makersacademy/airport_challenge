require 'airport'

describe Airport do

  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe "#land" do
    it 'lands plane at airport' do
      expect(subject.land(plane)).to eq [plane]
    end
    it 'throws error is airport is full' do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end
  end

  describe "#take_off" do
    it 'expects plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq []
    end
  end

  describe "#left_airport?" do
    it 'confirms plane has left the airport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.left_airport?).to eq true
    end
  end

  describe "#initialize" do

    it 'sets a default capacity if none given' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'default capacity can be overridden' do
      airport = Airport.new(40)
      expect(airport.capacity).to eq 40
    end
  end

end
