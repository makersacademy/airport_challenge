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

# RSpec ways of making doubles that can respond to things

# it "passes" do
#     dbl = double("Some Collaborator")
#     expect(dbl).to receive(:foo)
#     dbl.foo

# let(:string) { "a string" }
#   before { allow(string).to receive(:length).and_return(500) }

describe Airport do

  context 'taking off and landing' do
    # DRY out tests using this code later
    # let(:plane) { double :plane }
    # allow(plane).to receive(:land!)
    it 'a plane can land' do
      plane = double :plane
      allow(plane).to receive(:land!)
      expect(subject.land_plane(plane)).to be nil
    end

    it 'a plane can take off' do
      plane = double :plane, flying?: false
      allow(plane).to receive(:land!)
      subject.land_plane(plane)
      expect(subject.plane_take_off).to eq plane
    end

    it 'a plane cannot take off if the airport is empty' do
      expect { subject.plane_take_off }.to raise_error 'Airport Empty'
    end
  end

  context 'traffic control' do

    it 'can return its capacity' do
      expect(subject.capacity).to eq 20
    end

    it 'can return the landed planes' do
      expect(subject.planes).to eq []
    end

    it 'a plane cannot land if the airport is full' do
      plane = double :plane
      allow(plane).to receive(:land!)
      20.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error 'Airport Full'
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
