require 'Airport'  # ~> LoadError: cannot load such file -- Airport

#Method 'forecast' is a remnant of my old weather system which was built on a 'weather' class, and turned out to be a big waste of time and confusing, when a much simpler solution was available.

describe Airport do

  let(:plane){double(:plane)}
  # let(:forecast){double(:forecast, {:stormy=>true})}

    it 'knows its capacity' do
      expect(subject).to respond_to :capacity
    end


    it 'releases a plane' do
      expect(subject).to respond_to :release_plane
    end


    it 'receives a plane' do
      expect(subject).to respond_to :receive_plane
    end


    it 'increases the number of planes within the airport when an aircraft lands' do
      expect{subject.receive_plane(double :plane)}.to change{subject.planes.length}.by(1)
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

  describe 'weather' do

    it 'can be stormy' do
      expect(subject).to respond_to :stormy?
    end

  #   it "can be in a state of storminess" do
  #   expect(subject.stormy?).to be true
  #   end
  end
  #
  #   context 'when weather conditions are stormy' do
  #     it 'does not allow a plane to take off' do
  #     expect{subject.release_plane(double: plane)}.to raise_error("No take off allowed while stormy")
  #   end
  # end

end
