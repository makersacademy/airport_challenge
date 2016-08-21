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
      plane = double(:plane)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "#{plane} has taken off from #{subject}"
    end
  end

end
