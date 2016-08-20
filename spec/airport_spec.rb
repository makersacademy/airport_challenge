require 'airport'
describe Airport do

subject(:airport) {described_class.new}
subject(:custom_airport) {described_class.new(capacity: 0)}

before do
  allow(STDOUT).to receive(:puts)
  allow(Kernel).to receive(:rand).and_return(10)
end

context 'initialization' do
  it 'can be initialized with a custom capacity' do
    expect(custom_airport.instance_variable_get(:@capacity)).to eq(0)
  end
end

describe '#land(plane) operations' do
  before(:example) do
    @plane = double(:plane, landed?: false)
    @plane2 = double(:plane, landed?: false)
  end
  context 'in normal landing scenario' do
    it 'can land multiple objects' do
      expect(@plane).to receive(:land)
      airport.land(@plane)
      expect(@plane2).to receive(:land)
      airport.land(@plane2)

      res = [@plane, @plane2]
      expect(airport.instance_variable_get(:@landed_planes)).to eq(res)
    end
  end
  context 'defends against edge cases' do
    it 'will not land objects if weather unsafe' do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(@plane).to_not receive(:land)

      error= 'Poor weather means the plane has to divert.'
      expect { airport.land(@plane) }.to raise_error(error)
    end
    it 'should not land objects when over capacity' do
      expect(@plane).to_not receive(:land)
      error = 'Airport is full, the plane has diverted.'
      expect {custom_airport.land(@plane)}.to raise_error(error)
    end
    it 'should prevent landed planes from landing again' do
      allow(@plane).to receive(:landed?).and_return(true)
      expect(@plane).to_not receive(:land)
      error = 'That plane is at another airport.'
      expect {airport.land(@plane)}.to raise_error(error)
    end
  end
end

describe '#takeoff(plane) operations' do
  before(:example) do
    @plane = double(:plane, landed?: true)
    @plane2 = double(:plane, landed?: true)
    airport.instance_variable_set(:@landed_planes,[@plane,@plane2])
  end
  context 'in normal takeoff scenario' do
    it 'can takeoff the correct object' do
      expect(@plane2).to receive(:takeoff)
      airport.takeoff(@plane2)
      expect(airport.instance_variable_get(:@landed_planes)).to eq([@plane])
    end
  end
  context 'defends against edge cases' do
    it 'will not takeoff objects if weather unsafe' do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(@plane).to_not receive(:takeoff)
      error = 'Poor weather means the plane can not takeoff.'
      expect { airport.takeoff(@plane) }.to raise_error(error)
    end
    it 'should prevent objects taking off from wrong airport' do
      plane3 = double(:plane, landed?: true)
      expect(plane3).to_not receive(:takeoff)
      error = 'That plane is at another airport'
      expect {airport.takeoff(plane3)}.to raise_error(error)
    end
    it 'should prevent flying objects from taking off' do
      plane3 = double(:plane, landed?: false)
      expect(plane3).to_not receive(:takeoff)
      error = 'That plane is currently flying'
      expect {airport.takeoff(plane3)}.to raise_error(error)
    end
  end
end

end
