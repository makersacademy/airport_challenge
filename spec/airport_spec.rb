require 'airport'

  describe Airport do

    subject(:airport) { described_class.new(Airport::DEFAULT_CAPACITY, weather) }
    let(:plane) { double :plane }
    let(:weather) {double(:weather, stormy?: false)}

    describe "#initialize" do
      it "sets the capacity to a default value of 20 if no argument is passed" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it "sets the capacity to 100 if 100 is passed as an argument" do
      airport = Airport.new(100)
      expect(airport.capacity).to eq 100
      end
    end

      describe '#land' do
        it 'confirms that a plane has landed' do
        expect(subject.land(plane)).to eq "Flight #{plane} has landed at the airport."
        end

        it 'will not allow plane to land if weather is stormy' do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { subject.land(plane) }. to raise_error("Too stormy to land.")
        end

        it 'will not allow a plane to land if the airport is full' do
          subject.capacity.times { subject.land(plane) }
          expect { subject.land(plane) }. to raise_error("Airport at maximum capacity.")
        end

      end

      describe '#take_off' do
        it 'confirms that a plane has taken off' do
        subject.land(plane)
        expect(subject.take_off).to eq "Flight #{plane} has taken off from the airport."
        end

        it 'will not allow plane to take off if weather is stormy' do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { subject.take_off }. to raise_error("Too stormy to take off.")
        end

        it 'will not allow a plane to take off if there are no planes in the hanger' do
        expect { subject.take_off }. to raise_error("There are no planes in the hanger.")
        end
    end


 end
