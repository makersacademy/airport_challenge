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
  context 'landing' do
    it 'allows a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'stores a plane when landed' do
      plane = Plane.new
      expect(subject.land(plane)).to match_array([plane])
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
  end
end
