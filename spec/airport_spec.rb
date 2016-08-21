require 'airport'

describe Airport do

  describe 'land(plane)' do
    it 'confirms a plane has landed' do
      plane = double(:plane)
      expect(subject.land(plane)).to eq "#{plane} has landed"
    end
  end

  it 'stores a plane at airport' do
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
    allow(subject).to receive(:stormy?).and_return(true)
    plane = double(:plane)
    subject.land(plane)
    expect {subject.take_off(plane)}.to raise_error 'Plane cannot take off due to a stormy conditions'
  end

end
