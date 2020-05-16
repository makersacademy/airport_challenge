require 'airport'

describe Airport do
  it 'responds to #land plane' do 
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'responds to #take_off plane' do 
    expect(subject).to respond_to(:take_off)
  end

  it 'responds to #full?' do 
    expect(subject).to respond_to(:full?)
  end
  
  describe '#take_off' do
    it 'releases a plane' do
      plane = subject.take_off 
      expect(plane).to be_instance_of(Plane)
    end
  end
end
