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

  describe 'launch' do
    it 'launches a specific plane' do
      expect(subject).to respond_to(:launch).with(1).argument
    end
  end

  describe 'launch' do
    it 'raises an error when you try to launch a plane that isn\'t there' do
      @hanger = [:plane1]
      expect { subject.launch(:plane2) }.to raise_error 'That plane isn\'t here'
    end
  end


  describe 'land' do
    it 'receives a plane' do
      expect(subject).to respond_to(:launch).with(1).argument
    end
  end

  describe 'land' do
    it 'raises an error when you try to land a plane when there isn\'t room' do
      Airport::DEFAULT_CAPACITY.times{subject.land(:plane)}
      expect { subject.land(:plane) }.to raise_error 'There\'s no room here'
    end
  end

  describe 'land' do
    it 'raises an error when you try to land a plane in a storm' do
      @weather = :stormy
      expect { subject.land(:plane) }.to raise_error 'It\'s too dangerous to land!'
    end
  end

  describe 'capacity' do
  it 'has a capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
end

  describe 'space_check' do
    it 'can return its spare space, which is lowered by a plane landing' do
      subject.land(:plane)
      expect(subject.space_check). to eq (Airport::DEFAULT_CAPACITY-1)
    end
  end

  describe 'space_check' do
    it 'can return its spare space, which is raised by a plane launching' do
      subject.land(:plane1)
      subject.land(:plane2)
      subject.launch(:plane1)
      expect(subject.space_check). to eq (Airport::DEFAULT_CAPACITY-1)
    end
  end

  describe 'weather' do
    it 'has states of weather' do
      expect(subject).to respond_to(:weather)
    end
  end


  describe 'traffic control' do
    context 'when airport is full' do
      xit 'does not allow a plane to land'
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
