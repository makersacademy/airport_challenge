require 'airport'
require 'plane'

describe Airport do

  describe '#land_plane' do

    it { is_expected.to respond_to :land_plane }

# THIS COULD BE DELETED AS BECOMES REDUNDANT WITH FURTHER TESTS
    it { is_expected.to respond_to(:land_plane).with(1).argument }

    it 'raises an error when stormy - prevents plane landing' do
      allow(subject).to receive(:weather_check).and_return "stormy"
      expect { subject.land_plane(Plane.new) }.to raise_error 'Landing prevented due to stormy weather'
    end

# THE ABOVE TEST COULD HAVE BEEN RE-WRITTEN LIKE THIS SO YOU DON'T BREAK LONG LINES
    # it 'raises an error when stormy - prevents plane landing' do
    #   allow(subject).to receive(:weather_check).and_return "stormy"
    #   message = 'Landing prevented due to stormy weather'
    #   expect { subject.land_plane(Plane.new) }.to raise_error(message)
    # end

    # COULD HAVE RUN TEST THAT A PLANE CAN LAND WHEN SUNNY
    # COULD HAVE TESTED THAT 2 PLANES CAN GO INTO THE ARRAY

# NOTES FROM CODE REVIEW - Could have added this test
    # it 'has the plane after it has landed' do
    #   allow(Plane.new).to receive(land_plane)
    #   subject.land_plane(Plane.new)
    #   expect(subject.planes).to include(Plane.new)
    # end

    it { is_expected.to respond_to :planes }

    it 'plane can only land if it is flying and not already in airport' do
      allow(subject).to receive(:weather_check).and_return "sunny"
      allow(subject).to receive(:status).and_return "flying"
      plane = Plane.new
      subject.land_plane(plane)
      expect { subject.land_plane(plane) }.to raise_error 'Error'
    end

  end

  describe '#initialization' do

# NEED TO FIX TEST
    # it 'raises an error when airport hits max capacity' do
    #   allow(subject).to receive(:weather_check).and_return "sunny"
    #   subject.capacity.times { subject.land_plane(Plane.new) }
    #   expect { subject.land_plane(Plane.new) }.to raise_error 'Airport full'
    # end

    it 'has a default capacity with instance variable' do
      expect(subject.capacity).to eq Airport::AIRPORT_CAPACITY
    end

# NEED TO FIX TEST
    # it 'has a variable capacity' do
    #   airport = Airport.new(150)
    #   150.times { airport.land_plane(Plane.new) }
    #   expect { airport.land_plane(Plane.new) }.to raise_error 'Airport full'
    # end

  end

  describe '#take_off' do

    it { is_expected.to respond_to :take_off }

    it 'plane takes off from airport it is in' do
      allow(subject).to receive(:weather_check).and_return "sunny"
      allow(subject).to receive(:status).and_return "grounded"
      plane1 = Plane.new
      subject.land_plane(plane1)
      expect(subject.take_off(plane1)).to eq 'The plane has taken off'
    end

    it 'raises an error when stormy - prevents plane taking off' do
      allow(subject).to receive(:weather_check).and_return "sunny"
      subject.land_plane(Plane.new)
      allow(subject).to receive(:weather_check).and_return "stormy"
      expect { subject.take_off(Plane.new) }.to raise_error 'Take off prevented due to stormy weather'
    end

    it 'plane can only take off if it is grounded' do
      allow(subject).to receive(:weather_check).and_return "sunny"
      allow(subject).to receive(:status).and_return "flying" ##CHECK THIS, COULD ALSO BE USED AS :flying
      expect { subject.take_off(Plane.new) }.to raise_error 'Error'
    end

    it 'plane can only take off if it is already in airport' do
      allow(subject).to receive(:weather_check).and_return "sunny"
      allow(subject).to receive(:status).and_return "grounded"
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.planes).to include(plane)
    end

  end
# WEATHER TEST COULD GO INTO CONTEXT BLOCK
  it 'generates random weather' do
    airport = Airport.new
    allow(airport).to receive(:rand).and_return "stormy"
    expect(airport.weather_check).to eq "stormy"
  end

end
