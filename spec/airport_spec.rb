require 'airport'

describe Airport do
  describe '#land_plane' do 
    it 'when .land_plane is run with string string is in airport hangar' do
      subject.land_plane('plane_string')
      expect(subject.hangar).to include('plane_string')
    end
    it 'when .land_plane is run with plane the plane is in hangar' do
      plane = Plane.new 
      subject.land_plane(plane)
      expect(subject.hangar).to include(plane)
    end
    it 'wont let a plane land if the airport is full' do
      plane1 = Plane.new
      plane2 = Plane.new
      weather = Weather.new
      airport = Airport.new(1)
      airport.land_plane(plane1)
      weather.instance_variable_set(:@stormy, false)
      subject.instance_variable_set(:@weather, weather)
      expect { airport.land_plane(plane2) }.to raise_error('Airport is full')
    end
    it 'wont let a plane land if the weather is stormy' do 
      plane = Plane.new 
      weather = Weather.new
      weather.instance_variable_set(:@stormy, true)
      subject.instance_variable_set(:@weather, weather)
      expect { subject.land_plane(plane) }.to raise_error{'It is too stormy'}
    end
    it 'wont let a plane land twice' do 
      plane = Plane.new
      subject.land_plane(plane)
      expect {subject.land_plane(plane)}.to raise_error{'Plane is already in hangar'}
    end
  end

  describe '#take_off' do
    
    it 'when .take_off is called with plane as arg it leaves hangar' do
      plane = Plane.new 
      weather = Weather.new
      subject.land_plane(plane)
      weather.instance_variable_set(:@stormy, false)
      subject.instance_variable_set(:@weather, weather)
      subject.take_off(plane)
      expect(subject.hangar).to_not include(plane)
    end

    it 'doesnt let a plane take off if the weather is stormy' do 
      plane = Plane.new 
      weather = Weather.new
      weather.instance_variable_set(:@stormy, true)
      subject.instance_variable_set(:@weather, weather)
      expect { subject.take_off(plane) }.to raise_error{'It is too stormy'}
    end
    it 'lets a plane take off if the weather is not stormy' do 
      plane = Plane.new 
      subject.land_plane(plane)
      weather = Weather.new
      weather.instance_variable_set(:@stormy, false)
      subject.instance_variable_set(:@weather, weather)
      subject.take_off(plane)
      expect(subject.hangar).to_not include(plane)
    end
    it 'wont let a plane take off if not in hangar' do
      plane = Plane.new
      expect {subject.take_off(plane)}.to raise_error('Plane is not in hangar')
    end
  end
end
