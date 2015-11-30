require 'airport.rb'

describe Airport do

  describe '#initialize' do
    subject(:airport) { described_class.new }
    it 'sets capacity to argument passed' do
      airp = Airport.new(30)
      expect(airp.capacity).to eq(30)
    end

    it 'if no argument passed, set\'s capacity to default capacity' do
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'only accepts the capacity of planes' do
      capacity = rand(1..50)
      airport = Airport.new(capacity)
      allow(airport).to receive(:stormy?).and_return(false)

      capacity.times do
        plane = double(:plane)
        allow(plane).to receive(:landing).and_return(false)
        airport.land(plane)
      end
      plane = double(:plane)
      expect{airport.land(plane)}.to raise_error('Airport is full and cannot land')
    end

  end

  describe '#land' do
  subject(:airport) { described_class.new }
    it 'can land a plane' do
      plane = double(:plane)
      allow(plane).to receive(:landing).and_return(false)
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'it has the plane stored after is has landed' do
      plane = double(:plane)
      allow(plane).to receive(:landing).and_return(false)
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(airport.planes).to include plane
    end

   context 'when weather is stormy' do
     it 'prevents landing' do
       plane = double(:plane)
       allow(airport).to receive(:stormy?).and_return(true)
       allow(plane).to receive(:landing).and_return(true)
       expect{airport.land(plane)}.to raise_error('plane cannot take land in a storm')
     end
   end

   context 'when airport is full' do
    it 'prevents landing when airport is full' do
      plane = double(:plane)
      plane2 = double(:plane)
      allow(plane).to receive(:landing).and_return(false)
      allow(plane2).to receive(:landing).and_return(false)
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect{airport.land(plane2)}.to raise_error('Airport is full and cannot land')
    end
   end
    it 'can only land planes that have not already been landed' do
      plane = double(:plane)
      allow(plane).to receive(:landing).and_return(false)
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect{airport.land(plane)}.to raise_error('plane is already in airport')
    end

  end

  describe '#take_off' do
  subject(:airport) { described_class.new }

    it 'takes off from the airport' do
      plane = double(:plane)
      allow(plane).to receive(:landing).and_return(false)
      allow(plane).to receive(:taking_off).and_return(true)
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to eq []
    end
    context 'when weather is stormy' do
      it 'prevents take off' do
        plane = double(:plane)
        allow(airport).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:landing).and_return(false)
        airport.land(plane)
        allow(airport).to receive(:stormy?).and_return(true)
        expect{airport.take_off(plane)}.to raise_error('plane cannot take off in a storm')
      end
    end
    it 'can only take_off planes that have already landed' do
      plane = double(:plane)
      expect{airport.take_off(plane)}.to raise_error('plane cannot take off from somewhere it hasnt landed')
    end
  end
end
