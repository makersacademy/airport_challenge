require 'airport'

describe Airport do
  subject(:airport) {described_class.new(2, weather)}
  subject(:large_airport) {described_class.new(20, weather)}
  let(:plane) {double :plane}
  let(:plane2) {double :plane}
  let(:plane3) {double :plane}
  let(:weather) {double :weather}

   before do
     allow(plane).to receive(:land)
     allow(plane).to receive(:status)
     allow(plane).to receive(:taken_off)
   end

describe '#Landing Planes' do
  before do
    allow(weather).to receive(:stormy?) {false}
  end

    it 'stores a plane in the airport when landing' do
      expect(airport.instruct_landing(plane).last).to eq(plane)
    end

    it 'plane has landed and confirms landing' do
      plane = Plane.new
      airport.instruct_landing(plane)
      expect(plane.status).to eq("The plane has landed")
    end

    it 'raises error if plane has already landed' do
      plane = Plane.new
      airport.instruct_landing(plane)
      expect {plane.land}.to raise_error("The plane has already landed")
    end
end

describe '#Planes Taking Off' do
  before(:each) do
    allow(weather).to receive(:stormy?) {false}
  end

    it 'returns plane when taking off' do
      airport.instruct_landing(plane)
      expect(airport.instruct_take_off(plane)).to eq(plane)
    end

    it 'plane takes off and confirms it is no longer in the airport' do
      plane = Plane.new
      airport.instruct_landing(plane)
      airport.instruct_take_off(plane)
      expect(plane.status).to eq("The plane has taken off")
    end

    it 'raises error if plane has already taken-off (one+ plane required in the airport)' do
      plane = Plane.new
      airport.instruct_landing(plane)
      plane2 = Plane.new
      airport.instruct_landing(plane2)
      airport.instruct_take_off(plane2)
      expect {airport.instruct_take_off(plane2)}.to raise_error("The plane has already taken off")
    end
end

describe '#Capacity' do
  before(:each) do
    allow(weather).to receive(:stormy?) {false}
  end

    it 'the airport has a default capacity of 2 planes' do
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'the airport can have a capacity of 20 planes' do
      expect(large_airport.capacity).to eq(20)
    end

    it 'raises an error when there is no space in the airport for a plane to land' do
      Airport::DEFAULT_CAPACITY.times { airport.instruct_landing(Plane.new) }
      expect {airport.instruct_landing(plane2)}.to raise_error("There is no space in the airport")
    end

    it 'raises an error when there are no planes to take off from the airport' do
      expect {airport.instruct_take_off(plane)}.to raise_error("There are no planes in the airport")
    end
end

describe '#Stormy Weather' do

    it 'raises error when trying to land in stormy weather', focus:true do
      allow(weather).to receive(:stormy?) {true}
      expect{airport.instruct_landing(plane)}.to raise_error("The weather is too stormy to land")
    end

    it 'raises error when trying to take off in stormy weather' do
      allow(weather).to receive(:stormy?) {false}
      airport.instruct_landing(plane)
      allow(weather).to receive(:stormy?) {true}
      expect {airport.instruct_take_off(plane)}.to raise_error("The weather is too stormy to take off")
      end
end
end
