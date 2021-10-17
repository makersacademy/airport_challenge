require 'Airport'

describe Airport do
  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  it 'has default capacity' do
    DEFAULT_CAPACITY = 20
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'has capacity that can be overwritten' do
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end

  describe '#land' do 
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    context 'when airport full' do
      it 'prevents a plane form landing' do
        allow(airport).to receive(:stormy?).and_return false
        20.times{airport.land(plane)}
        expect{airport.land(plane)}.to raise_error('You can not land, airport is full!')
      end
    end

    context 'when stormy' do
      it 'prevents a plane from landing' do
        allow(airport).to receive(:stormy?).and_return true
        expect{airport.land(plane)}.to raise_error('Weather is too bad, you are not allowed to land')
      end
    end    

  end
  
  describe '#takeoff' do 
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:takeoff)
    end

    context 'when empty' do 
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return false
        airport.land(plane)
        airport.takeoff
        expect{airport.takeoff}.to raise_error('Airport is empty')
      end
    end

    context 'when stormy' do
      it 'prevents a plane from taking off' do
        allow(airport).to receive(:stormy?).and_return true
        expect{airport.takeoff}.to raise_error('Weather is too bad, you are not allowed to take off')
      end
    end


  end 
end

