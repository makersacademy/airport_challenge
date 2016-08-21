require 'airport'

describe Airport do

  describe 'land(plane)' do
    it 'confirms a plane has landed' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = double(:plane)
      expect(subject.land(plane)).to eq "#{plane} has landed"
    end

    it 'cannot land a plane when at capacity' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = double(:plane)
      subject.capacity.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "#{subject} is currently at full capacity"
    end
  end

  it 'stores a plane at airport' do
    allow(subject).to receive(:stormy?).and_return(false)
    plane = double(:plane)
    subject.land(plane)
    expect(subject.landed_planes).to include plane
  end

  describe 'take_off(plane)' do
    it 'takes off a plane and confirms it has left' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = double(:plane)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "#{plane} has taken off from #{subject}"
    end
  end

  it 'removes plane from airport once it has taken off' do
    allow(subject).to receive(:stormy?).and_return(false)
    plane = double(:plane)
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.landed_planes).to be_empty
  end

  it 'cannot take off when weather is stormy' do
    plane = double(:plane)
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land(plane)
    allow(subject).to receive(:stormy?).and_return(true)
    expect {subject.take_off(plane)}.to raise_error 'Plane cannot take off due to a stormy conditions'
  end

  it 'cannot land a plane when weather is stormy' do
    allow(subject).to receive(:stormy?).and_return(true)
    plane = double(:plane)
    expect {subject.land(plane)}.to raise_error "Plane cannot land due to stormy conditions"
  end

  it 'has a capacity' do
    expect(subject.capacity).to eq 20
  end

end
