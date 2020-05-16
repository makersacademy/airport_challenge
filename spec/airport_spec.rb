require 'airport'
require 'plane'

describe Airport do
  it 'creates an instance of the class Airport' do
    expect(subject).to be_instance_of Airport
  end
  it 'creates an array for storing planes' do
    expect(subject.instance_variable_get :@planes_in)
  end
  it 'creates a capacity instance variable' do
    expect(subject.instance_variable_get :@capacity).to eq(20)
  end
  it 'gives possibility to change the max capacity when the new airport is init' do
    expect(Airport.new(30).instance_variable_get :@capacity).to eq(30)
  end
  context 'landing' do
    it 'allows a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'stores a plane when landed' do
      plane = Plane.new
      expect(subject.land(plane)).to match_array([plane])
    end
    it 'does not allow a plane to land if full capacity is reached' do
      20.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error('no space for landing')
    end
    it 'does not allow a plane to land if the plane is already in the airport' do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error('this plane is already in the airport')
    end
  end
  context 'take-off' do
    it 'allows a plane to take-off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'plane no longer in the airport after take-off' do
      plane = Plane.new
      plane1 = Plane.new
      subject.land(plane)
      subject.land(plane1)
      expect(subject.take_off(plane)).not_to include(plane)
    end
    it 'raise an error if take_off is called for a plane that is not in the airport' do
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error('this plane is not in this airport')
    end
  end
end
