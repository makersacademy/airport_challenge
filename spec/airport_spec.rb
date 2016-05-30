require 'airport'

describe Airport do
  subject (:airport) {airport = Airport.new}

  describe '#land' do
    it 'should not allow planes to land if they already landed' do
    plane = double(:plane,landed: true)
    expect{airport.land(plane)}.to raise_error 'The plane is on the ground Fool!'
    end

    it 'should not allow planes to land if the weather is stormy' do
    plane = double(:plane,landed: false)
    expect{airport.land(plane)}.to raise_error 'Sorry bad weather, find another airport' if airport.stormy
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

    it 'should not allow planes to take off if the weather is stormy' do
      plane = double(:plane,landed: true)
      expect{airport.take_off(plane)}.to raise_error 'Sorry bad weather, wait a moment' if airport.stormy
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


end