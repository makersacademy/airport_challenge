require 'airport'

describe Airport do

  context 'when created' do
    it 'has a control tower' do
      expect(subject).to respond_to :control_tower
    end

    it 'can park planes' do
      subject.park :plane
      expect(subject.planes).to eq([:plane])
    end

    it 'has a standard capacity of 30' do
      30.times { subject.park :plane }
      expect { subject.park :plane }.to raise_error 'Airport is Full'
    end

    it 'has a variable capacity' do
      airport = Airport.new capacity: 200
      200.times { airport.park :plane }
      expect { airport.park :plane }.to raise_error 'Airport is Full'
    end
  end

  context 'when it has plane stored inside' do
    it 'can unpark planes' do
      subject.park :plane
      subject.unpark :plane
      expect(subject.planes).to eq([])
    end
  end

  context 'traffic control' do

    xit 'a plane cannot land if the airport is full'

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do
      xit 'a plane cannot take off when there is a storm brewing'

      xit 'a plane cannot land in the middle of a storm'
    end
  end
end
