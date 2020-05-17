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
    it 'does not allow a plane to land if the weather is stormy' do
      allow(subject).to receive(:forecast) { 20 }
      expect { subject.land(Plane.new) }.to raise_error('too stormy to land')
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
    it 'does not allow a plane to take-off if the weather is stormy' do
      allow(subject).to receive(:forecast) { 20 }
      expect { subject.take_off(Plane.new) }.to raise_error('too stormy to take-off')
    end
  end

  context 'full?' do
    it 'return true when full capacity is reached' do
      20.times { subject.land(Plane.new) }
      expect(subject.full?).to be(true)
    end
  end

  context 'plane_already_in?' do
    it 'return true when a plane is in the airport already' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane_already_in?(plane)).to be(true)
    end
  end

  context 'forecast' do
    it 'generate a random number between 1 and 20. 20 represents stormy weather' do
      expect(subject.forecast).to be_between(1, 20)
    end
  end
end

describe Plane do
  it 'generate an instance of the class Plane' do
    expect(Plane.new).to be_instance_of Plane
  end
end
