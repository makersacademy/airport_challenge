require 'airport'
describe Airport do
  let (:airport) { described_class.new(10)}
  let (:plane) { double :plane }
 
    it 'responds to land' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'instructs a plane to land' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport.land(plane)).to(eq(plane))
    end

    it 'throws an error if a plane tries to land when full' do
      allow(airport).to receive(:stormy?).and_return false
      10. times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error "The airport is full!"
      end

    it 'throws an error if a planes tries to land when stormy.' do
      allow(airport).to receive(:stormy?).and_return true
      expect{airport.land(plane)}.to raise_error 'You cannot land the weather is stormy'
    end
  
    it 'responds to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    allow(airport).to receive(:stormy?).and_return false
    end

    it 'instructs a plane to take off' do
    allow(airport).to receive(:stormy?).and_return false
    expect(airport.take_off(plane)).to(eq(plane))
    end
  
    it 'throws an error if a planes tries to take_off when stormy.' do
        allow(airport).to receive(:stormy?).and_return true
        expect{airport.take_off(plane)}.to raise_error 'You cannot take off the weather is stormy'
    end
 
end
 
  