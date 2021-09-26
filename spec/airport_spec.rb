require 'airport'

describe Airport do

  describe '#land' do

    it 'allows a plane to land' do
      allow(subject).to receive(:stormy?).and_return false
      expect(subject).to respond_to(:land).with(1).arguments
    end

    it 'returns error if the airport is full' do
      allow(subject).to receive(:stormy?).and_return false
      50.times { subject.land(Plane.new) }
      expect {subject.land(Plane.new)}.to raise_error 'Cannot land - airport is full'
    end

    it 'raises and error before landing if the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return true
      expect {subject.land(Plane.new)}.to raise_error "Cannot land - stormy weather" 
    end

  end 

  describe '#take_off' do

    it 'allows a plane to take off' do
      expect(subject).to respond_to(:take_off).with(1).arguments
    end

    it 'updates the terminal capacity when a plane takes off' do
      # airport = Airport.new
      allow(subject).to receive(:stormy?).and_return false
      10.times { subject.land(Plane.new) } 
      subject.take_off(Plane.new)
      expect(subject.terminal.count).to eq 9
    end

    it 'raises and error before take off if the weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return true
      expect {subject.take_off(plane)}.to raise_error "Cannot take off - stormy weather"
    end

  end

  it 'has a default airport capacity' do
    expect(subject.capacity).to eq 50
  end

end

