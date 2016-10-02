require 'airport'
require 'weather'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane1) {double :plane}
  let(:weather1) {double :weather}

  describe 'tests that need to call #land on a plane double' do
    before do
      allow(plane1).to receive(:land).and_return(plane1)
    end

    context 'when weather is stormy' do
      before do
        allow(weather1).to receive(:stormy?).and_return(true)
      end
        it 'raises an error to stop plane landing' do
          expect{airport.land(plane1)}.to raise_error("Stormy weather")
        end
    end

    context 'when weather is fine' do
      before do
        allow(weather1).to receive(:stormy?).and_return(false)
      end
        it 'allows plane to land' do
          expect(airport.land(plane1)).to eq(plane1)
        end

        it 'confirms that the plane has landed' do
          airport.land(plane1)
          expect(airport.plane).to eq plane1
        end

        describe 'tests that need to call #take_off on a plane double' do
          before  do
            allow(plane1).to receive(:take_off).and_return(nil)
          end

          it 'instructs plane to take off from airport' do
            airport.land(plane1)
            expect(airport.take_off(plane1)).to eq nil
          end

          it 'confirms that plane is no longer in the airport' do
            airport.land(plane1)
            airport.take_off(plane1)
            expect(airport.plane).to eq nil
          end

          context 'when weather is stormy' do
            before do
              allow(weather1).to receive(:stormy).and_return(true)
            end
          end
            it 'when weather is stormy, raises an error to stop plane taking off' do
              expect{airport.take_off(plane1)}.to raise_error("Plane can't take off due to stormy weather")
            end
        end
    end
  end


end
