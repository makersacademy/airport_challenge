require 'airport'

describe Airport do
  it 'returns landed plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane 
  end 

  describe '#take_off' do
    it 'instructs plane to take_off' do
      #assume that airport starts empty
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane 
    end
  end
end
