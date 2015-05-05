require 'airport'

describe Airport do

  context 'taking off and landing' do

  describe 'approves_landing'

    it 'Airport approves plane to land'do
    subject.approves_landing :plane
    expect(subject).not_to be_stormy
  end

    it 'Airport approves plane to take off'do
    subject.approves_landing :plane
    plane = subject.approves_take_off
    expect(subject).not_to be_stormy
  end

    it 'a plane cannot land if the airport is full' do
      capacity = subject::capacity
      capacity.times {subject.approves_landing :plane}
      expect {subject.approves_landing :plane}.to raise_error 'Airport is full'
    end



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
