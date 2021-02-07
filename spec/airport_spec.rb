require 'airport'

describe Airport do

  it { should respond_to :land }
  it { should respond_to :take_off }
  it { should respond_to :plane_at_airport? }
  it { should respond_to :full? }

  context 'when airport and plane instances exist' do
    before do
      @airport = Airport.new
      @plane = Plane.new
    end

    describe 'is expected to take a plane as an argument and return the same instance' do
      it 'when :land is called' do
        expect(@airport.land(@plane)).to eq @plane
      end

      it 'when :take_off is called' do
        expect(@airport.take_off(@plane)).to eq @plane
      end

      it 'when :plane_at_airport is called' do
        allow(@airport).to receive(:plane_at_airport?) { @plane }
      end
    end

    context 'when a plane has already landed at airport' do
      before do
        @airport.land(@plane)
      end

      describe ":plane_at_airport? is expected to return" do

        it 'true' do
          expect(@airport.plane_at_airport?(@plane)).to eq true
        end

        it 'false, if plane has :taken_off' do
          @airport.take_off(@plane)
          expect(@airport.plane_at_airport?(@plane)).to eq false
        end
      end
    end

    context 'when airport is full (20 or more planes currently landed at the airport)' do
      before do
        20.times { @airport.land(Plane.new) }
      end

      it 'is expected to return true when :full? is called' do
        expect(@airport.full?).to eq true
      end

      it 'is expected to raise an error if user attempts to land plane' do
        expect { @airport.land(Plane.new) }.to raise_error("Airport is currently full. You cannot land.")
      end
    end
  end
end
