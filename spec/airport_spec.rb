require 'airport'

describe Airport do

  before :each do
    @airport = Airport.new
    @plane = double(:plane)
    allow(@plane).to receive(:flying?).and_return(false)
    allow(@plane).to receive(:flying=).and_return(true)
    @err1 = 'Cannot land in bad weather'
    @err2 = 'Cannot take off in bad weather'
  end

  describe '#accessor' do
    it 'allows read of plane_hangar' do
      expect(@airport.plane_hangar << @plane).to eq [@plane]
    end

    it 'allows write of plane_hangar' do
      @airport.plane_hangar = [@plane, @plane]
      expect(@airport.plane_hangar).to eq [@plane, @plane]
    end

    it 'allows read of weather' do
      expect(@airport.weather).to eq(10)
    end

    it 'allows write of weather' do
      @airport.weather = 2
      expect(@airport.weather).to eq(2)
    end
  end

  describe '#land' do
    it 'adds plane to plane_hangar' do
      @airport.land(@plane)
      expect(@airport.plane_hangar).to eq([@plane])
    end

    it 'lands in good weather' do
      @airport.weather = 2
      @airport.land(@plane)
      expect(@airport.plane_hangar).to eq([@plane])
    end

    it 'does not land in bad weather' do
      @airport.weather = 1
      expect { @airport.land(@plane) }.to raise_error(@err1)
    end
  end

  describe '#takeoff' do
    before :each do
      @airport.plane_hangar << @plane
      @airport.weather = 10
    end

    it 'returns plane if weather is good' do
      expect(@airport.takeoff(@plane)).to eq(@plane)
    end

    it 'raises error if weather is bad' do
      @airport.weather = 1
      expect { @airport.takeoff(@plane) }.to raise_error #(@err2)
    end

    it 'confirms plane is no longer in airport' do
      @airport.takeoff(@plane)
      expect(@airport.plane_hangar.empty?).to eq(true)
    end
  end

  describe '#weather?' do
    it 'returns true if weather is 2' do
      @airport.weather = 2
      expect(@airport.weather?).to eq(true)
    end

    it 'returns false if weather is 1' do
      @airport.weather = 1
      expect(@airport.weather?).to eq(false)
    end
  end

  describe '#full?' do
    it 'returns whether the capacity has been reached as a bool' do
      20.times {@airport.plane_hangar << @plane}
      expect(@airport.full?).to eq(true)
    end
  end
end
