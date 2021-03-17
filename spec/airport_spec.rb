require 'airport'

describe Airport do
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }
  
  before do
    subject.instance_variable_set(:@weather, weather)
  end
 
  describe '#land_plane' do 
    it 'when .land_plane is run with string string is in airport hangar' do
      expect(weather).to receive(:storm?).and_return(false)
      subject.land_plane('plane_string')
      expect(subject.hangar).to include('plane_string')
    end
    it 'checks update_weather is called in land_plane' do
      expect(weather).to receive(:update_weather)
      subject.land_plane(plane)
    end
    it 'when .land_plane is run with plane the plane is in hangar' do
      expect(weather).to receive(:storm?).and_return(false)
      subject.land_plane(plane)
      expect(subject.hangar).to include(plane)
    end
    it 'wont let a plane land if the airport is full' do
      airport = Airport.new(0)
      airport.instance_variable_set(:@weather, weather)
      expect(weather).to receive(:storm?).and_return(false)
      expect { airport.land_plane(plane) }.to raise_error('Airport is full')
    end
    it 'wont let a plane land if the weather is stormy' do 
      expect(weather).to receive(:storm?).and_return(true)
      expect { subject.land_plane(plane) }.to raise_error('It is too stormy')
    end
    it 'wont let a plane land twice' do 
      expect(weather).to receive(:storm?).and_return(false)
      subject.land_plane(plane)
      expect(weather).to receive(:storm?).and_return(false)
      expect { subject.land_plane(plane) }.to raise_error('Plane is already in hangar')
    end
  end

  describe '#take_off' do
    
    it 'when .take_off is called with plane as arg it leaves hangar' do
      expect(weather).to receive(:storm?).and_return(false)
      subject.land_plane(plane)
      expect(weather).to receive(:storm?).and_return(false)
      subject.take_off(plane)
      expect(subject.hangar).to_not include(plane)
    end

    it 'doesnt let a plane take off if the weather is stormy' do 
      expect(weather).to receive(:storm?).and_return(false)
      subject.land_plane(plane)
      expect(weather).to receive(:storm?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error('It is too stormy')
    end
    it 'lets a plane take off if the weather is not stormy' do 
      expect(weather).to receive(:storm?).and_return(false)
      subject.land_plane(plane)
      expect(weather).to receive(:storm?).and_return(false)
      subject.take_off(plane)
      expect(subject.hangar).to_not include(plane)
    end
    it 'wont let a plane take off if not in hangar' do
      expect { subject.take_off(plane) }.to raise_error('Plane is not in hangar')
    end
  end
end
