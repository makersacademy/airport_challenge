require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) {double :planes, plane_landed: true, land: true}

  before do
    allow(airport.weather).to receive(:is_sunny?) { false }
  end

  context 'Capacity Test' do
    describe '#capacity' do
      it 'Airport has default capacity at initialization' do
        expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it 'Airport has set capacity at initialization' do
        random_number = rand(100)
        airport = Airport.new(random_number)
        expect(airport.capacity).to eq random_number
      end
    end

    describe 'Full capacity' do
      it 'Airport has full capacity' do
        expect{ (Airport::DEFAULT_CAPACITY + 1).times do
          plane = double(:planes, plane_landed: true, land: true)
          airport.land(plane)
        end
        }.to raise_error 'Airport capacity is full'
      end
    end
  end

  context 'Plane landing test' do
    describe 'The weather is sunny' do
      describe '#land(plane)' do
        it 'The plane has landed' do
          plane = double(:planes, land: true)
          expect(airport.land(plane)).to eq [plane]
        end

        it 'Error: The plane has already landed' do
          plane = double(:planes, land: true)
          airport.land(plane)
          expect{ airport.land(plane) }.to raise_error 'The plane has already landed'
        end
      end

      describe '#in_airport?(plane)' do
        it 'The plane is in the airport' do
          plane = double(:planes, land: true)
          airport.land(plane)
          expect(airport.in_airport?(plane)).to eq true
        end
      end
    end

    describe 'The weather is stormy' do
      it 'Error: The plane cannot land in stormy weather' do
        allow(airport.weather).to receive(:is_sunny?) { true }
        plane = double(:planes, land: true)
        expect{ airport.land(plane) }.to raise_error 'The weather is too stormy to land'
      end
    end
  end

  context 'Plane taking off test' do
    describe 'The weather is sunny' do
      describe '#take_off(plane)' do
        it 'The plane takes off' do
          plane = double(:planes, land: true, take_off: false)
          airport.land(plane)
          expect(airport.take_off(plane)).to eq plane
        end

        it 'Error: The plane has already taken off' do
          plane = double(:planes, land: true, take_off: false)
          airport.land(plane)
          airport.take_off(plane)
          expect{ airport.take_off(plane) }.to raise_error 'The plane has already taken off'
        end
      end

      describe '#in_airport?(plane)' do
        it 'Confirm take off' do
          plane = double(:planes, land: true, take_off: false)
          airport.land(plane)
          airport.take_off(plane)
          expect(airport.in_airport?(plane)).to eq false
        end
      end
    end

    describe 'The weather is stormy' do
      it 'Error: The plane cannot take off in stormy weather' do
        plane = double(:planes, land: true)
        airport.land(plane)
        allow(airport.weather).to receive(:is_sunny?) { true }
        expect{ airport.take_off(plane) }.to raise_error 'The weather is too stormy to take off'
      end
    end
  end

  describe 'Weather Test' do
    context '#is_sunny?' do
      it 'Weather is sunny or stormy' do
        expect(airport.is_sunny?).to eq(true).or eq(false)
      end
    end
  end
end
