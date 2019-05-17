require 'airport'

describe Airport do
  let(:my_airport) { Airport.new }

  context 'creating an airport' do
    it 'allows Airport objects to be created' do
      expect(Airport.new).to be_kind_of(Airport)
    end

    it 'can set a default capacity' do
      expect(my_airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'can be instantiated with a different capacity' do
      my_larger_airport = Airport.new(100)

      expect(my_larger_airport.capacity).to eq(100)
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

      expect(my_airport.landed).to include(flying_double)
    end

    it 'can store multiple flying objects' do
      flying_double_1 = double
      flying_double_2 = double

      my_airport.land(flying_double_1)
      my_airport.land(flying_double_2)

      expect(my_airport.landed)
          .to include(flying_double_1, flying_double_2)
    end


    it 'can limit the amount of planes landed' do
      flying_double = double

      Airport::DEFAULT_CAPACITY.times do
        my_airport.land(flying_double)
      end

      expect { my_airport.land(flying_double) }
          .to raise_error Airport::AIRPORT_AT_CAPACITY_ERROR
    end

    it 'can limit the amount of planes landed in a large airport' do
      flying_double = double

      my_larger_airport = Airport.new(50)

      50.times do
        my_larger_airport.land(flying_double)
      end
      expect { my_larger_airport.land(flying_double) }
          .to raise_error Airport::AIRPORT_AT_CAPACITY_ERROR
    end
  end
end
