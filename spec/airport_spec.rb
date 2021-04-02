require 'airport'
require 'weather'

describe Airport do

  it 'has a default capacity' do
    expect(subject.capacity).to eq(10)
  end

  it 'lets you set custom capacity' do
    airport = Airport.new(20)
    expect(airport.capacity).to eq(20)
  end

  it 'can have a storm value' do
    Weather.any_instance.stub(:stormy?).and_return(false)
    expect(subject.storm).to eq(false)
  end

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
      Weather.any_instance.stub(:stormy?).and_return(false)
      expect(subject.hangar).to include(plane)
    end
  
    it 'can respond to plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to include(plane)
    end

    it 'prevents planes from landing when airport is full' do
      plane = Plane.new
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end

    it 'prevents a plane from landing in a storm' do
      plane = Plane.new
      Weather.any_instance.stub(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error 'Weather is too bad'
    end
  end

  describe '#take_off' do
    
    it 'can respond to take_off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'lets a plane take_off' do
      plane = Plane.new
      subject.land(plane)
      Weather.any_instance.stub(:stormy?).and_return(false)
      subject.take_off
      expect(subject.hangar).to be_empty
    end

    it 'prevents planes from taking off when airport is empty' do
      expect { subject.take_off }.to raise_error 'Airport is empty'
    end

    it 'prevents a plane from taking off in a storm' do
      Weather.any_instance.stub(:stormy?).and_return(true)
      subject.add_plane
      p subject
      expect { subject.take_off }.to raise_error 'Weather is too bad'
    end
  end
end
