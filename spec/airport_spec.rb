require 'airport'

describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  describe 'take off' do
    it 'instructs a plane to take off' do
      is_expected.to respond_to(:plane_take_off).with(1).argument
    end

    it 'releases a plane' do
      airport.plane_land(plane)
      airport.plane_take_off(plane)
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      is_expected.to respond_to(:plane_land).with(1).argument
    end

    it 'receives a plane' do
      subject.plane_land(plane)
    end

     it 'can\'t land same plane twice' do
       subject.plane_land(plane)
       expect { subject.plane_land(plane)}.to raise_error 'Plane has already landed'
     end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        subject.capacity.times { subject.plane_land(Plane.new)}
        expect { subject.plane_land(Plane.new)}.to raise_error 'Airport is full'
      end
    end

    context 'when airport is empty' do
      it 'no planes can take off' do
        subject.empty? { subject.plane_take_off(plane)}
        expect { subject.plane_take_off(plane)}.to raise_error 'Airport is empty'
      end
    end


    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  end
end
