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

let(:plane){ double :plane, airborne?:true}
let(:airport){Airport.new}


  it { is_expected.to respond_to(:request_take_off).with(1).argument }
  it { is_expected.to respond_to(:request_land).with(1).argument }


  describe '#request_land' do
    it 'instructs a plane to land and receives plane' do
    allow(plane).to receive(:ground)
    airport.request_land(plane)
    expect(airport.planes.pop).to eq plane
  end
    ###ALTERNATE TO MAKING ABOVE WORK WOULD BE TO DO expect(airport.planes).to eq [plane]


  describe '#request_take_off' do
    it 'instructs a plane to take off, then releases a plane' do
    allow(plane).to receive(:ground)
    allow(plane).to receive(:fly_away)
    airport.request_land(plane)
    airport.request_take_off(plane)
    expect(airport).to be_empty
  end


    context 'traffic control' do

      it 'checks airport capacity when landing' do
        expect(airport.possible_land?).to eq true
      end


      it 'when airport is full, does not allow a plane to land' do
        allow(plane).to receive(:ground)
        airport.capacity.times{ airport.request_land(plane) }
        expect{airport.request_land(plane)}.to raise_error
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
      storm = double :airport, :weather=>:stormy
      allow(storm).to receive(:possible_take_off?)
      expect(storm.possible_take_off?).to_not be true
    end

      it 'does not allow a plane to land' do
      storm = double :airport, :weather=>:stormy
      allow(storm).to receive(:possible_land?)
      expect(storm.possible_land?).to_not be true
    end

    end
  end
end
end


