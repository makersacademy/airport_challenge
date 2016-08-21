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

end
