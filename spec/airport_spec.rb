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

  context 'weather is clear' do

    before(:each) do
      allow(@airport).to receive(:weather) { "sunny" }
    end

    it 'plane can land and get stored in hanger' do
      @airport.land(@plane)
      expect(@airport.hanger).to include(@plane)
    end

    it 'take off plane from @airport and confirm @plane is not in hanger' do
      @airport.land(@plane)
      @airport.takeoff(@plane)
      expect(@airport.hanger).not_to include(@plane)
    end

    it 'raies error if trying to land while airport is full' do
      @airport.land(@plane)
      expect { @airport.land(@plane) }.to raise_error("Can't land, airport is full")
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
