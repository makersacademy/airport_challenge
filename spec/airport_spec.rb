require 'airport'
require 'support/shared_examples_for_weather_generator'

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

  describe '-> take off' do

    it '--> instructs plane to take_off if sunny' do
      plane = double :plane, land: "landed"
      allow(subject).to receive( :check_weather ) {"sunny"}
      subject.clear_to_land plane
      expect(plane).to receive( :take_off ).and_return "flying"
      subject.clear_to_takeoff plane
    end

    it '--> releases a plane' do
      plane = double :plane, land: "landed", take_off: "flying"
      allow(subject).to receive( :check_weather ) {"sunny"}
      subject.clear_to_land plane
      subject.clear_to_takeoff plane
      expect( subject.planes ).to be_empty
    end

    it '--> doesn\'t release a plane if empty' do
      plane = double :plane
      expect{ subject.clear_to_takeoff plane }.to raise_error "No such plane in airport"
    end
  end

  describe '-> landing' do
    let(:plane) {double :plane, land: "landed"}
    it '--> instructs a plane to land' do
      allow(subject).to receive( :check_weather ) {"sunny"}
      expect(plane).to receive :land
      subject.clear_to_land plane
    end

    it '--> receives a plane' do
      allow(subject).to receive( :check_weather ) {"sunny"}
      subject.clear_to_land plane
      expect( subject.planes ).not_to be_empty
    end
  end

  describe '-> traffic control' do
    context '~ when airport is full' do
      it '--> does not allow a plane to land' do
        plane = double :plane, land: "landed"
        allow(subject).to receive( :check_weather ) {"sunny"}
        subject.capacity.times { subject.clear_to_land plane }
        expect { subject.clear_to_land plane }.to raise_error "No space at airport"
      end
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane cannot land, and must not be in the airport

    context '-> when weather conditions are stormy' do
      it '--> does not allow a plane to take off' do
        allow(subject).to receive( :check_weather ) {"sunny"}
        plane = double :plane, land: "landed"
        subject.clear_to_land plane
        allow(subject).to receive( :check_weather ) {"stormy"}
        expect{ subject.clear_to_takeoff plane}.to raise_error "Can't take off in stormy weather"
      end

      it '--> does not allow a plane to land' do
        plane = double :plane, land: "landed", take_off: "flying"
        allow(subject).to receive( :check_weather ) {"stormy"}
        expect{ subject.clear_to_land plane}.to raise_error "Can't land in stormy weather"
      end
    end
  end

  it_behaves_like WeatherGenerator
end
