require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:landing).with(1).argument }

  it { is_expected.to respond_to :release_plane }

  it 'has a DEFAULT capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end


  describe 'take off' do

    # it 'instructs a plane to take off' do
    #   subject.landing plane
    #   subject.release_plane
    # end

    it 'releases planes' do
      # what expectation can you add here that actually tests something?
      subject.release_plane
    end

  end

  describe 'landing' do

    # it 'instructs a plane to land' do
    #   subject.landing plane
    #   plane.land
    # end

    it 'receives a plane' do
      # what expectation can you add here that actually tests something?
      subject.landing plane
    end
  end

  describe 'traffic control' do

    context 'when airport is full' do

      it 'does not allow plane to land' do
        subject.capacity.times { subject.landing plane }
        expect{ subject.landing plane }.to raise_error 'The airport is full!'
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
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  end
end
