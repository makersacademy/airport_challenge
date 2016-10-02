require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  context 'when instructed to land' do
    it 'can land at an airport and confirm that it has landed' do
      plane.land
      expect(plane.landed?).to be true 
    end
    it 'cannot land if it has already landed' do
      plane.land
      expect { plane.land }.to raise_error("This plane has already landed!")
    end
  end
  
  it 'does not land unless instructed to land' do
    expect(plane.landed?).to be false
  end

  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  context 'when instructed to take off' do
    it 'can take off from an airport and confirm that it is no longer in the airport' do
      plane.land
      plane.take_off
      expect(plane.airborne?).to be true
    end

    it 'cannot take off if it is already airborne' do
      expect { plane.take_off }.to raise_error("This plane is no longer in the airport!")
    end
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent takeoff when weather is stormy

end
