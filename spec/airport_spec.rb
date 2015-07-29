require 'airport'
require 'plane'


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

   describe "initial state of airport" do

    it "will have a capacity of 3 planes" do
      airport = Airport.new
      expect(airport.capacity).to eq 3
    end

    it "is sunny on creation" do
      new_airport = Airport.new
      expect(new_airport.weather_status).to eq "sunny"
    end


  describe 'take off' do
    it 'instructs a plane to take off and plane takes off' do
      plane = Plane.new
      subject.instruct_take_off(plane)
      expect(subject.planes_at_airport).to be_empty
    end

  end

  describe 'landing' do
    it "instructs a plane to land and recieves a plane" do
      plane = Plane.new
      airport = Airport.new
      subject.instruct_landing(plane)
      expect(subject.planes_at_airport).to eq [plane]
    end

  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane = Plane.new
        3.times { subject.instruct_landing(plane) }
        expect{subject.instruct_landing(plane)}.to raise_error 'Airport is full'
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
        allow(subject).to receive(:weather) { 'sunny' }
        plane = Plane.new
        subject.instruct_take_off(plane)
        allow(subject).to receive(:weather) { 'stormy' }
        expect { subject.instruct_take_off(plane) }.to raise_error 'It is stormy - you cannot take off!'
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather) { 'sunny' }
        plane = Plane.new
        subject.instruct_landing(plane)
        allow(subject).to receive(:weather) { 'stormy' }
        expect { subject.instruct_landing(plane) }.to raise_error 'It is stormy - you cannot land!'
      end
  end
end
end
end