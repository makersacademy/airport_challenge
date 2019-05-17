require 'airport'

describe Airport do
  let(:my_airport) { Airport.new }

  context 'before creating an airport' do
    it 'allows Airport objects to be created' do
      expect(Airport.new).to be_kind_of(Airport)
    end
  end

  describe '#land' do
    it 'can respond to land' do
      expect(subject).to respond_to(:land)
    end

    it 'can respond to land with an argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'returns the object it receives' do
      flying_double = double
      expect(my_airport.land(flying_double)).to eq(flying_double)
    end

    it 'stores the flying object' do
      flying_double = double

      my_airport.land(flying_double)

      expect(my_airport.landed).to eq(flying_double)

    end
  end
end
