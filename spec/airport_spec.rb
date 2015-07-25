require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:landing).with(1).argument
    end

    it 'receives a plane' do
      p = double :plane
      p.stub(:land)
      subject.stub(:current_weather).and_return('sunny')
      subject.landing p
      expect(subject).not_to be_empty
    end
  end

  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'cannot release a plane which is not at the airport' do
      p = double :plane
      p.stub(:take_off)
      subject.stub(:current_weather).and_return('sunny')
      expect{subject.take_off p}.to raise_error 'The plane is not at the airport'

    end

    it 'releases a plane' do
      p = double :plane
      p.stub(:take_off)
      p.stub(:land)
      subject.stub(:current_weather).and_return('sunny')
      subject.landing p
      expect(subject.take_off p).to be p.take_off
    end

  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        p = double :plane
        p.stub(:land)
        subject.stub(:current_weather).and_return('sunny')
        subject.capacity.times{subject.landing p}
        expect{subject.landing p}.to raise_error 'Cannot land plane. Airport is full'
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
      it 'does not allow a plane to take off' do
        subject.stub(:current_weather).and_return('stormy')
        expect{subject.take_off double(:plane)}.to raise_error 'Too stormy to take off'
      end

      it 'does not allow a plane to land' do
        subject.stub(:current_weather).and_return('stormy')
        expect{subject.landing double(:plane)}.to raise_error 'Too stormy to land'
      end

    end

  end

end
