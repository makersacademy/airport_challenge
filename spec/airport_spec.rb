require 'Airport'  # ~> LoadError: cannot load such file -- Airport
require 'Weather'

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

  let(:plane){double(:plane)}
  let(:weather){double(:weather, {:stormy=>false})}

    it 'knows its capacity' do
      expect(subject).to respond_to :capacity
    end

  # describe 'take off' do
  #   xit 'instructs a plane to take off'


    it 'releases a plane' do
      expect(subject).to respond_to :release_plane
    end


  # describe 'landing' do
  #   xit 'instructs a plane to land'

    it 'receives a plane' do
      expect(subject).to respond_to :receive_plane
    end


    it 'increases the number of planes within the airport when an aircraft lands' do
      expect{subject.receive_plane(plane)}.to change{subject.planes.length}.by(1)
      unless (subject.full?)
      end
    end



  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land if at full capacity' do
        subject.capacity.times {subject.receive_plane(double :plane)}
        expect { subject.receive_plane (double :plane) }.to raise_error 'Airport full'
      end
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
        subject.release_plane(plane)
      expect{:weather}.to raise_error("No take off allowed while stormy")
    end
  end


      # xit 'does not allow a plane to land'


end

# ~> LoadError
# ~> cannot load such file -- Airport
# ~>
# ~> /Users/matt/.rvm/rubies/ruby-2.1.5/lib/ruby/site_ruby/2.1.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/matt/.rvm/rubies/ruby-2.1.5/lib/ruby/site_ruby/2.1.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/matt/Dropbox/Projects/airport_challenge/spec/airport_spec.rb:1:in `<main>'
