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

  let(:plane) { double :plane }

  it { is_expected.to respond_to(:instruct_to_take_off).with(1).argument }
  it { is_expected.to respond_to(:instruct_to_land).with(1).argument }

  it 'has a default capacity' do 
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end


  #describe 'take off' do
    it 'instructs a plane to take off' do 
      expect(plane).to receive(:take_off)
      subject.instruct_to_take_off(plane)
    end

    it 'releases a plane' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      subject.instruct_to_land(plane)
      expect(subject.instruct_to_take_off(plane)).to be plane
    end

  #describe 'landing' do

    it 'instructs a plane to land' do 
      expect(plane).to receive(:land)
      subject.instruct_to_land(plane)
    end

    it 'receives a plane' do 
      allow(plane).to receive(:land)
      expect(subject.instruct_to_land(plane)).to be plane 
    end


  #end

  #describe 'traffic control' do
    #context 'when airport is full' do
      it 'does not allow a plane to land when at capacity' do
        allow(plane).to receive(:land)
        subject.capacity.times { subject.instruct_to_land(plane) }
        expect { subject.instruct_to_land(plane) }.to raise_error 'Airport is full'
      end


    #end

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
  #end
end
