require 'airport'

describe Airport do
  subject (:airport) {described_class.new}


  describe '#land' do
    it 'should not allow planes to land if they already landed' do
    plane = double(:plane,landed: true)
    expect{airport.land(plane)}.to raise_error 'The plane is on the ground Fool!'
    end

    before { allow(airport).to receive(:stormy).and_return(true) }
      it 'stops planes from landing by stormy weather' do
        plane = double(:plane,landed: false)
        expect{airport.land(plane)}.to raise_error 'The weather is not adequate'
    end
    context 'if the weather is not stormy' do
      before { allow(airport).to receive(:stormy).and_return(false) }
        it 'should not allow planes to land if the airport is full' do
          Airport::DEFAULT_CAPACITY.times {airport.land(Plane.new)}
          plane = double(:plane,landed: false)
          expect{airport.land(plane)}.to raise_error 'Sorry, the airport is full.'
        end
    end


  end

  describe '#take_off' do
    it 'should not allow planes to take off if they are in the airport' do
      plane = double(:plane,landed: false)
      expect{airport.take_off(plane)}.to raise_error 'The plane is in the air Fool!'
    end

    before { allow(airport).to receive(:stormy).and_return(true) }
      it 'should not allow planes to take off if the weather is stormy' do
        plane = double(:plane,landed: true)
        expect{airport.take_off(plane)}.to raise_error 'The weather is not adequate'
    end

  end

  describe '#stormy' do
    it {should respond_to(:stormy)}
  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a default capacity that can be overriden' do
      airport2 = Airport.new((rand(20)+2))
      expect(airport.capacity).not_to eq(airport2.capacity)
    end

  end

  describe '#change_capacity' do
    it 'should change the airport capacity' do
      expect(airport.change_capacity(5)).to eq 5
    end

    context 'There is two planes in the airport'
      before {allow(airport).to receive(:planes).and_return(2)}
        it 'should not allow capacity to be inferior to number of planes' do
        expect{airport.change_capacity(1)}.to raise_error 'the airport capacity cannot be lower than the number of planes'
      end

  end

end