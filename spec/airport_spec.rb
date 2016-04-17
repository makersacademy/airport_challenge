require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  let(:permit_duplicates) { allow(airport).to receive(:in_airport?).and_return false }
  before { allow(plane).to receive(:landed) }

  describe "#planes" do

    it 'a new airport has no planes' do
      expect(airport.planes).to eq []
    end

    it 'lists all landed planes' do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it "has a variable capacity" do
      capacity = 20
      airport = Airport.new(capacity)
      expect(airport.capacity). to eq capacity
		end

		it "sets the the capacity to a default value when capacity is not provided" do
			expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
		end
  end


  describe '#land' do
    context 'when conditions are not stormy' do
      before { allow(airport).to receive(:stormy?).and_return false }

        it 'instructs a plane to land' do
          airport.land(plane)
        end

         it 'prevents landing when airport is full' do
           permit_duplicates
           airport.capacity.times { airport.land(plane)}
           message = "Airport full"
           expect { subject.land(plane)}.to raise_error message
         end

        it 'a plane that has landed cannot land again' do
          airport.land(plane)
          message = "Plane already landed"
          expect { airport.land(plane) } .to raise_error message
        end

        # it 'a plane cannot land in two airports' do
        #    allow(plane).to receive(:landed)
        #    airport1 = described_class.new
        #    airport2 = described_class.new
        #    airport1.land(plane)
        #    message = "Plane landed in other airport"
        #    expect { airport2.land(plane) } .to raise_error message
        # end
    end

    context 'when conditions are stormy' do
      before { allow(airport).to receive(:stormy?).and_return true }

      it 'prevents landing when weather is stormy' do
        message = "Too stormy to land"
        expect { airport.land(plane) } .to raise_error message
      end
    end
  end

  describe '#take_off' do

    before { allow(plane).to receive(:departed) }

    context 'when conditions are not stormy' do
      before { allow(airport).to receive(:stormy?).and_return false }

        it 'instructs a plane to take off' do
          airport.land(plane)
          airport.take_off(plane)
        end

        it 'does not have the plane after take off' do
          airport.land(plane)
          airport.take_off(plane)
          expect(airport.planes).to_not include plane
        end

        it 'prevents take off when airport is empty' do
          message = "Airport empty"
          expect { airport.take_off(plane) } .to raise_error message
        end

         it 'a plane can only take off from an airport it is in' do
           plane1 = Plane.new
           plane2 = Plane.new
           subject.land(plane2)
           message = "Plane not at airport"
           expect { subject.take_off(plane1) } .to raise_error message
         end
    end

    context 'when conditions are stormy' do

        it 'prevents take off when weather is stormy' do
          allow(airport).to receive(:stormy?).and_return false
          airport.land(plane)
          allow(airport).to receive(:stormy?).and_return true
          message = "Too stormy to take off"
          expect { airport.take_off(plane) } .to raise_error message
        end

        it 'a plane can take off after the stormy weather has passed' do
          allow(airport).to receive(:stormy?).and_return false
          airport.land(plane)
          allow(airport).to receive(:stormy?).and_return true
          allow(airport).to receive(:stormy?).and_return false
          expect { airport.take_off(plane) } .to_not raise_error
        end
    end
  end
end
