require 'airport'
require 'plane'
require 'weather'

describe Airport do

let(:weather) { double :weather, stormy?: false }

    describe '#land' do
      it { is_expected.to respond_to :land }

      it 'should allow plane to land at the airport' do
        plane=Plane.new
        allow(subject).to receive(:no_go?).and_return (false)
        subject.land(plane)
        expect(subject.planes_at_airport).to include plane
      end

      it 'should prevent landing when it is stormy' do
        plane = Plane.new
        allow(weather).to receive(:random_outlook) {:stormy}
        allow(weather).to receive(:stormy?).and_return(true)
        allow(subject).to receive(:no_go?).and_return (true)
        expect {subject.land(plane)}.to raise_error "Unable to land, it's stormy"
      end
    end


    describe '#take_off' do
      it {is_expected.to respond_to :take_off}

      it 'should allow plane to take off' do
        plane=Plane.new
        # allow(weather).to receive(:random_outlook) {:sunny}
        # allow(weather).to receive(:stormy?).and_return(false)
        allow(subject).to receive(:no_go?).and_return (false)
        subject.land(plane)
        expect {subject.take_off(plane)}. not_to raise_error
        #expect(subject.planes_at_airport).not_to include(plane)
      end

      it 'should prevent plane from taking off if it is stormy' do
        plane = Plane.new
        # allow(weather).to receive(:random_outlook).and_return(:stormy)
        # allow(weather).to receive(:stormy?).and_return(true)
        allow(subject).to receive(:no_go?).and_return (true)
        # subject.land(plane) if used it would not work, may give other error
        expect {subject.take_off(plane)}.to raise_error "Unable to take off"
      end
    end

      # it 'when the plane leaves it should confirm it has left the airport' do
      #   plane=Plane.new
      #   subject.land(plane)
      #   weather=Weather.new
      #
      #   allow(weather).to receive(:stormy?).and_return(false)
      #   expect(subject.take_off(plane)).to eq("Plane #{plane} has left")
      # end


  end
