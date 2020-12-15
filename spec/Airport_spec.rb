require 'Airport'

describe Airport do

  it 'has default capacity' do
    # assert
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'can set capacity' do
    # arrange
    airport = Airport.new
    # act
    airport.capacity(60)
    60.times { airport.land Plane.new }
    # asset
    expect { airport.land Plane.new }.to raise_error 'Airport holding is full'
  end

  describe '#land' do
    # subject { Airport.new }
    it 'lands planes and puts the plane in holding' do
      # arrange -> gather all the objects we need
      plane = Plane.new
      # act -> execute the method under test
      subject.land(plane)
      # assert -> place some assertion regarding what the method should have done
      expect(subject.holding).to include plane
    end 

    it 'throws an error when the airport is full' do
      # arrange and act (capacity is 10 planes)
      subject.capacity.times { subject.land Plane.new }
      # assert
      expect { subject.land Plane.new }.to raise_error 'Airport holding is full'
    end
    
    it 'throws error if condition is too stormy to land' do
      allow(subject).to receive(:weather).and_return('stormy')
      
      expect { subject.land Plane.new }.to raise_error 'Weather condition bad, cannot land'
    end 
  end

  describe '#take_off' do
    it 'takes plane out off holding to take off' do
      # arrange -> gather all the objects we need
      plane = Plane.new
      plane2 = Plane.new
      # act -> execute the method under test
      subject.land(plane)
      subject.land(plane2)
      subject.take_off(plane)
      # assert -> place some assertion regarding what the method should have done
      expect(subject.holding).to match_array plane2
    end

    it 'throws error if condition is too stormy to take off' do
      # arrange -> gather all the objects we need
      subject.land Plane.new
      # act -> execute the method under test
      # I need subject.weather == 'stormy'
      allow(subject).to receive(:weather).and_return('stormy')
      # assert
      expect { subject.take_off Plane.new }.to raise_error 'Weather condition bad cannont take off'
    end
  end
end