require 'airport'
describe Airport do
  let (:airport) { described_class.new(10)}
  let (:plane) { double :plane }

  describe '#land' do 
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'instructs a plane to land' do
      expect(airport.land(plane)).to(eq(plane))
    end

    it 'throws an error if a plane tries to land and the airport is full' do
      10. times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error "The airport is full!"
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'instructs a plane to take off' do
    expect(airport.take_off(plane)).to(eq(plane))
    end
  end
end