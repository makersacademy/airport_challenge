require 'airport'

describe Airport do

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:land).with(1).argument }

  let(:plane) { double() }
  let(:weather) { double :weather }
  let(:subject) { Airport.new(weather: weather) }

  describe '#take_off' do

    it 'raises an error when there are no planes to take off' do
      expect { subject.take_off(plane) }.to raise_error 'No planes available'
    end

    it 'raises an error when the weather is stormy' do
      subject.land(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error 'Weather is stormy'
    end

    it 'checks if hangar does not include the plane anymore' do
      subject.land(plane)
      allow(weather).to receive(:stormy?).and_return(false)
      subject.take_off(plane)
      expect(subject.hangar).to eq []
    end

    it 'displays message "Plane has taken off"' do
      subject.land(plane)
      allow(weather).to receive(:stormy?).and_return(false)
      expect { subject.take_off(plane) }.to output("Plane has taken off\n").to_stdout
    end
  end

  describe '#land' do
    it 'docks a landing plane' do
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end

    it 'raises an error when airport is full' do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }. to raise_error 'Airport is full'
    end
  end

  describe '#initialize' do
    it 'has a variable capacity' do
      airport = Airport.new(3)
      3.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Airport is full'
    end
  end

end
