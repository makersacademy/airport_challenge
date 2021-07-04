require 'airport'

describe Airport do

  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe "#land" do

    before { allow(subject).to receive(:weather) { 'sunny' } }

    it 'lands plane at airport' do
      expect(subject.land(plane)).to eq [plane]
    end
    it 'throws error is airport is at full default capacity' do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end

    it 'prevents landing when stormy' do

      allow(subject).to receive(:weather) { 'stormy' } 
      expect { subject.land(plane) }.to raise_error 'Weather too bad'
    end

  end

  describe "#take_off" do

  before { allow(subject).to receive(:weather) { 'sunny' } }

    it 'expects plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq []
    end

    it 'confirms plane had left the airport' do
      subject.land(plane)
      expect(subject.take_off(plane)).not_to include [plane]
    end

    it 'raises error if weather is stormy' do
      subject.land(plane)
      allow(subject).to receive(:weather) { 'stormy' } 
      expect { subject.take_off(plane) }.to raise_error 'Weather too bad'
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
