require 'airport'
require 'plane' #This has to be substituted for a double!!!!!


describe Airport do

  it { is_expected.to respond_to(:landing).with(1).argument } 
  #First test: to see that the airport allows planes to land

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  #Second test: to see that the airport has a default capacity

  it { is_expected.to respond_to(:take_off).with(1).argument } 
  #Third test: to see that the airport allows planes to take off

  it 'raises an error when the airport is full' do
      expect do
      subject.capacity.times { subject.landing Plane.new}
    end.to raise_error 'The airport is full. No landings are possible.'
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    #context 'when weather conditions are stormy' do
     # xit 'does not allow a plane to take off'

      #xit 'does not allow a plane to land'

    end
