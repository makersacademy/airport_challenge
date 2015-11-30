require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let (:plane) {Plane.new}


describe '#land' do
    context 'when there is no storm landing' do
    before do
    allow(airport).to receive(:stormy?).and_return(false)
   end

     it { is_expected.to respond_to(:land).with(1).argument }

     it 'lands the plane at the airport' do
       expect(airport.land(plane)).to eq [plane]
     end

    it 'raise error when airport is full' do
      Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
      expect {airport.land(plane)}.to raise_error 'Airport is full'
    end
  end


  context 'when there is a storm landing' do
    before do
      allow(airport).to receive(:stormy?).and_return(true)
  end

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'does not allow plane to land in stormy weather' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect{airport.land(plane)}.to raise_error 'planes are not allowed to land in stormy weather'
  end
end

describe '#take_off' do
  context 'when there is no storm taking off' do
    before do
      allow(airport).to receive(:stormy?).and_return(false)
    end

      it { is_expected.to respond_to(:take_off).with(1).argument }

      it 'allows plane to take off from airport' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end

      it 'raise error when airport is empty' do
        allow(airport).to receive(:empty?).and_return(true)
        expect {airport.take_off(plane)}.to raise_error 'Airport is empty'
      end

    end

  context 'when there is a storm taking off' do
    before do
      allow(airport).to receive(:stormy?).and_return(true)
    end

     it { is_expected.to respond_to(:take_off).with(1).argument }

     it 'does not allow plane to take off in stormy weather' do
       allow(airport).to receive(:stormy?).and_return(true)
       allow(airport).to receive(:empty?).and_return(false)
       expect{airport.take_off(plane)}.to raise_error 'Planes are not allowed to take off in stormy weather'
     end

     it 'raise error when airport is empty' do
       allow(airport).to receive(:empty?).and_return(true)
       expect {airport.take_off(plane)}.to raise_error 'Airport is empty'
     end

    end

 describe 'Default capacity' do
  it 'Has a default capacity of DEFAULT_CAPACITY' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
end

 describe 'Override capacity' do
    it 'can override the default capacity' do
    airport = Airport.new(10)
    expect(airport.capacity).to eq 10
  end
end
end
end
end
