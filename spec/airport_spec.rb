require 'airport'

describe Airport do

  before :each do
    @airport = Airport.new
    @plane = double(:plane)
    @err1 = 'Cannot land in bad weather'
    @err2 = 'Cannot take off in bad weather'
  end

  describe '#accessor' do
    it 'allows read-write to plane_hangar' do
      expect(@airport.plane_hangar << @plane).to eq [@plane]
    end

    it 'allows read of weather' do
      expect(@airport.weather).to eq(10)
    end
  end

  describe '#land' do
    it 'adds plane to plane_hangar' do
      @airport.land(@plane)
      expect(@airport.plane_hangar).to eq([@plane])
    end

    it 'lands in good weather' do
      @airport.weather = 10
      expect(@airport.land(@plane)).to eq(true)
    end

    it 'does not land in bad weather' do
      @airport.weather = 1
      expect { @airport.land(@plane) }.to raise_error(@err1)
    end
  end

  describe '#takeoff' do
    it 'returns plane from hangar if weather is good' do
      @airport.plane_hangar << @plane
      expect(@airport.takeoff(@plane)).to eq([@plane])
    end

    it 'raises error if weather is bad' do
      @airport.plane_hangar << @plane
      @airport.weather = 1
      expect { @airport.takeoff(@plane) }.to raise_error(@err2)
    end
  end
end
