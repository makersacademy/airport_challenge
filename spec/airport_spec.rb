require 'airport.rb'

describe Airport do

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  it 'returns either stormy or sunny randomly when .weather is called' do
    srand 5
    expect(@airport.weather).to eq('sunny')
  end

  it 'can change hanger capacity' do
    airport = Airport.new(25)
    expect(airport.capacity).to eq(25)
  end

  context 'weather is clear' do

    before(:each) do
      allow(@airport).to receive(:weather) { "sunny" }
    end

    it 'plane can land and get stored in hanger' do
      @airport.land(@plane)
      expect(@airport.hanger).to include(@plane)
    end

    it 'take off plane from airport and confirm plane is not in hanger' do
      @airport.land(@plane)
      @airport.takeoff(@plane)
      expect(@airport.hanger).not_to include(@plane)
    end

    it 'raies error if trying to land while airport is full' do
      Airport::DEFAULT_CAPACITY.times { @airport.land(Plane.new) }
      expect { @airport.land(Plane.new) }.to raise_error("Can't land, airport is full")
    end

    it 'checks plane to make sure its in hanger before take off' do
      expect { @airport.takeoff(@plane) }.to raise_error('Plane is not in hanger')
    end

    it 'raises error if plane is in hanger when trying to land' do
      @airport.land(@plane)
      expect { @airport.land(@plane) }.to raise_error("Can't land plane, plane is currently in hanger")
    end
  end

  context 'weather is stormy' do

    before(:each) do
      allow(@airport).to receive(:weather) { "stormy" }
    end

    it 'raises error if trying to take off' do
      expect { @airport.takeoff(@plane) }.to raise_error("Can't take off because it's stormy")
    end

    it 'raises error if trying to land' do
      expect { @airport.land(@plane) }.to raise_error("Can't land because it's stormy")
    end

  end

end
