require 'airport'

describe Airport do

  describe 'basic interactions with planes:' do

    # A plane currently in the airport can be requested to take off.

    it { is_expected.to respond_to(:request_take_off).with(1).argument }

    it 'releases a plane that it instructs to take off' do
      plane = double :plane, take_off_from: nil, landed_at?: false
      subject.request_take_off(plane)
      expect(subject).not_to have_plane(plane)
    end

    # A plane currently flying can be requested to land.

    it { is_expected.to respond_to(:request_landing).with(1).argument }

    it 'receives a plane that it instructs to land' do
      plane = double :plane, land_at: nil, landed_at?: true
      subject.request_landing(plane)
      expect(subject).to have_plane(plane)
    end

  end

  describe 'traffic control:' do

    it { is_expected.to respond_to(:full?) }

    context 'when airport is full' do

      before(:example) do
        plane = double :plane, land_at: nil
        subject.request_landing(plane) until subject.full?
      end

      # If the airport is full then no planes can land

      it 'does not allow a plane to land' do
        plane = double :plane, land_at: nil
        expect {subject.request_landing(plane)}.to raise_error 'Airport is full'
      end

      # Airport is no longer full if a plane is instructed to take off

      it 'can request a take-off to free up space' do
        plane = double :plane, take_off_from: nil
        subject.request_take_off(plane)
        expect(subject).not_to be_full
      end

    end

  end

  #   # Include a weather condition.
  #   # The weather must be random and only have two states "sunny" or "stormy".
  #   # Try and take off a plane, but if the weather is stormy,
  #   # the plane can not take off and must remain in the airport.
  #   #
  #   # This will require stubbing to stop the random return of the weather.
  #   # If the airport has a weather condition of stormy,
  #   # the plane can not land, and must not be in the airport
  #
  #   context 'when weather conditions are stormy' do
  #     xit 'does not allow a plane to take off'
  #
  #     xit 'does not allow a plane to land'
  #   end
  #   end

end
