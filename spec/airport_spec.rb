require 'airport'

describe Airport do
  describe '#lands' do
    it 'method def' do
      expect(subject).to respond_to(:lands).with(1).argument
    end

    it 'plane lands' do
      plane = Plane.new
      expect(subject.lands(plane)).to eq plane
    end
  end

  describe '#takesoff' do 
    it 'method def' do
      expect(subject).to respond_to(:takesoff)
    end

    it 'takes off and no plane at airport' do
      plane = Plane.new # new plane
      subject.lands(plane) # plane is on land
      expect(subject.takesoff).to eq plane # plane takes off and is not on land 
    end
  end  
end