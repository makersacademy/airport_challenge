require 'airport'

describe Airport do
  capacity = Airport::DEFAULT_CAPACITY
  let(:plane) { double() }
  let(:weather) { double() }
  let(:subject) { Airport.new(capacity, weather) }

  describe '#take_off' do

    it 'raises an error when there are no planes to take off' do
      expect { subject.take_off(plane) }.to raise_error 'No planes available'
    end

    it 'raises an error when the weather is stormy' do
      help_landing
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error 'Weather is stormy'
    end

    it 'checks if hangar does not include the plane anymore' do
      help_landing
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:flying?).and_return(false)
      allow(plane).to receive(:take_off).and_return(true)
      subject.take_off(plane)
      expect(subject.hangar).to eq []
    end

  end

  describe '#land' do
    it 'docks a landing plane' do
      help_landing
      allow(weather).to receive(:stormy?).and_return(false)
      expect(subject.hangar).to eq [plane]
    end

    it 'raises an error when the weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error 'Weather is stormy'
    end

    it 'raises an error when airport is full' do
      subject.capacity.times { help_landing }
      expect { subject.land(plane) }. to raise_error 'Airport is full'
    end

  end

  def help_landing
    allow(weather).to receive(:stormy?).and_return(false)
    allow(plane).to receive(:flying?).and_return(true)
    allow(plane).to receive(:land).and_return(false)
    subject.land(plane)
  end

end
