require 'airport'

describe Airport do

  describe '#land' do
    it 'can respond to land' do
      expect(subject).to respond_to(:land)
    end
  
    it 'can respond to land with arguments' do
      expect(subject).to respond_to(:land).with(1).arguments
    end
  
    it 'can land a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to include(plane)
    end
  
    it 'can respond to plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to include(plane)
    end
  end

  describe '#take_off' do
    
    it 'can respond to take_off' do
      expect(subject).to respond_to(:take_off)
    end

    # it 'can respond to take_off with arguments' do
    #   expect(subject).to respond_to(:take_off).with(1).arguments
    # end
    #dont see that it needs an argument unless you need to act on specific named planes
  
    it 'lets a plane take_off' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off
      expect(subject.hangar).to be_empty
    end

    it 'prevents planes from landing when airport is full' do
      plane = Plane.new
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq(10)
    end

    it 'lets you set custom capacity' do
      airport = Airport.new(20)
      expect(airport.capacity).to eq(20)
    end

  end

end