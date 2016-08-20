require 'airport'
describe Airport do

subject(:airport) {described_class.new}
subject(:custom_airport) {described_class.new({capacity: 0})}

before do
  allow(STDOUT).to receive(:puts)
  allow(Kernel).to receive(:rand).and_return(10)
end

context 'initialization' do
  it 'can be initialized with a custom capacity' do
    expect(custom_airport.instance_variable_get(:@capacity)).to eq(0)
  end
end

context 'normal landing and takeoff' do
  describe '#land(plane)' do
    it 'can land multiple objects' do
      plane = double(:plane, landed?: false)
      plane2 = double(:plane, landed?: false)
      expect(plane).to receive(:land)
      airport.land(plane)
      expect(plane2).to receive(:land)
      airport.land(plane2)

      expect(airport.instance_variable_get(:@landed_planes)).to eq([plane, plane2])
    end
  end
  describe '#takeoff(plane)' do
    it 'can takeoff the correct object' do
      plane = double(:plane, landed?: false)
      plane2 = double(:plane, landed?: false)
      expect(plane).to receive(:land)
      airport.land(plane)
      expect(plane2).to receive(:land)
      airport.land(plane2)

      allow(plane).to receive(:landed?).and_return(true)
      expect(plane).to receive(:takeoff)
      airport.takeoff(plane)
      expect(airport.instance_variable_get(:@landed_planes)).to eq([plane2])
    end
  end
end

context 'defends against edge cases' do
  describe '#land edge cases' do
    it 'will not land objects if weather unsafe' do
      allow(Kernel).to receive(:rand).and_return(1)
      plane = double(:plane, landed?: false)
      expect(plane).to_not receive(:land)
      expect { airport.land(plane) }.to raise_error 'Poor weather means the plane has to divert.'
    end
    it 'should not land objects when over capacity' do
      plane = double(:plane, landed?: false)
      expect(plane).to_not receive(:land)
      expect {custom_airport.land(plane)}.to raise_error 'Airport is full, the plane has diverted.'
    end
    it 'should prevent landed planes from landing again' do
      plane = double(:plane, landed?: true)
      expect(plane).to_not receive(:land)
      expect {airport.land(plane)}.to raise_error 'That plane is at another airport.'
    end
  end
  describe '#takeoff edge cases' do
    it 'will not takeoff objects if weather unsafe' do
      plane = double(:plane, landed?: false)
      expect(plane).to receive(:land)
      airport.land(plane)

      allow(plane).to receive(:landed?).and_return(true)
      allow(Kernel).to receive(:rand).and_return(1)
      expect(plane).to_not receive(:takeoff)
      expect { airport.takeoff(plane) }.to raise_error 'Poor weather means the plane can not takeoff.'
    end
    it 'should prevent objects taking off from wrong airport' do
      plane = double(:plane, landed?: true)
      expect(plane).to_not receive(:takeoff)
      expect {airport.takeoff(plane)}.to raise_error 'That plane is at another airport'
    end
    it 'should prevent flying objects from taking off' do
      plane = double(:plane, landed?: false)
      expect(plane).to_not receive(:takeoff)
      expect {airport.takeoff(plane)}.to raise_error 'That plane is currently flying'
    end
  end
end
end
