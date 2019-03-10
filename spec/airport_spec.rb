require 'airport.rb'
# links the main code to the test file.

describe Airport do

  context 'Clear Weather' do
    before(:each) do
      @airport = Airport.new
      @plane = Plane.new
      allow(@airport).to receive(:stormy?) { false }
      # will run these functions before doing each test... pretty jazzy.
      # mock enables me to fabricate data so that tests dependent on this
      # won't mess up.
    end

    it 'responds to fly_plane' do
      expect(subject).to respond_to :fly_plane
      # simply a test that checks it recognises the method.
    end

    it 'returns a plane when we call fly_plane' do
      @airport.land_plane(@plane)
      expect(@airport.fly_plane).to be_a(Plane)
      # checks that this function makes a plane appear.
      # have to call land_plane before running the test,
      # as if there's no plane in the first place then it can't make one fly.
    end

    it { is_expected.to respond_to(:land_plane).with(1).argument }
    # checks that the method takes an argument.

    it 'adds a plane to the hangar when we call land_plane' do
      @airport.land_plane(@plane)
      expect(@airport.hangar).to eq [@plane]
    end

    it 'raises an error if there are no planes in the hangar' do
      expect { @airport.fly_plane }.to raise_error("No Planes!")
      # by not having put a plane in the hangar first,
      # we expect an error from the code in the block.
    end

    it 'raises an error if the hangar is full' do
      @airport.land_plane(@plane)
      expect { @airport.capacity.times { @airport.land_plane(@plane) } }.to raise_error("Too Full!")
      # the airport.capacity.times thing is filling up our hangar to capacity,
      # to check it won't add any more planes in.
    end

  end

  context 'Stormy Weather' do

    before(:each) do
      @airport = Airport.new
      @plane = Plane.new
      allow(@airport).to receive(:stormy?) { true }
    end

    it 'responds to stormy?' do
      expect(subject).to respond_to :stormy?
    end

    it 'raises a departure error if the weather is stormy' do
      expect { @airport.fly_plane }.to raise_error("Stop, no departures or arrivals due to stormy weather!")
    end

    it 'raises an arrival error if the weather is stormy' do
      expect { @airport.land_plane(@plane) }.to raise_error("Stop, no departures or arrivals due to stormy weather!")
    end

  end

end
