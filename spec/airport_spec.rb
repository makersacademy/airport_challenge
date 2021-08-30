require 'airport'

describe Airport do
  it 'default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY # namespace operator(::) access DEFAULT_CAPACITY constant defined by Airport class
  end

  describe '#lands' do
    it 'method def' do
      expect(subject).to respond_to(:lands).with(1).argument
    end

    it 'plane lands' do
      plane = Plane.new
      expect(subject.lands(plane)).to eq [plane]
    end

    it 'not land when airport is full, take into consideration of capacity - raises an error' do
      subject.capacity.times { subject.lands(Plane.new) } # Ruby .times loop
      expect{subject.lands(Plane.new)}.to raise_error 'Airport full - do not land!' 
    end
    
    it 'not land when stormy - raises an error' do
      weather = Weather.new
      weather.generates == :stormy
      expect{subject.lands(Plane.new)}.to raise_error 'Stormy - do not land!' 
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

    it 'not takeoff when stormy - raises an error' do
      weather = Weather.new
      weather.generates == :stormy
      expect{subject.takesoff}.to raise_error 'Stormy - do not takeoff!' 
    end
  end  
end