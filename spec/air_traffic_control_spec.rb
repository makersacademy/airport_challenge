# see helper_methods for definitions of helper methods used
describe AirTrafficControl do
  describe Airport do
    let(:plane) { instance_double(Plane, 'Plane') }
    let(:plane_2) { instance_double(Plane, 'Plane 2') }
    let(:plane_3) { instance_double(Plane, 'Plane 3') }

    it { is_expected.to respond_to(:request_landing).with 1 }
    it { is_expected.to respond_to(:request_take_off).with 1 }

    describe '#request_landing' do
      context 'when weather is sunny' do
        before { let_there_be_sun }

        context 'when airport is full' do
          it 'raises capacity error' do
            fill_it_up
            expect { subject.request_landing(plane) }.to raise_error CapacityError
          end
        end

        context 'when airport is not full' do
          it 'approves landing' do
            expect { land_one }.not_to raise_error
          end

          it 'adds plane to airport' do
            land_one
            expect(subject.contain?(plane)).to be true
          end
        end
      end

      context 'when weather is stormy' do
        it 'raises weather error' do
          make_it_rain
          expect { subject.request_landing(plane) }.to raise_error WeatherError
        end
      end
    end

    describe '#request_take_off' do
      context 'when weather is sunny' do
        before { let_there_be_sun }

        context 'when plane is in airport' do
          before { land_one }
          
          it 'approves take off' do
            expect { subject.request_take_off(plane) }.not_to raise_error
          end

          it 'removes plane from airport' do
            subject.request_take_off(plane)
            expect(subject.contain?(plane)).to be false
          end

          context 'when there are multiple planes' do
            before {
              subject.request_landing(plane_2)
              subject.request_landing(plane_3)
              subject.request_take_off(plane_2)
            }

            it 'only removes one plane' do
              expect(subject.send(:planes).count).to be 2
            end

            it 'removes the correct plane' do
              expect(subject.contain?(plane_2)).to be false
            end
          end
        end

        context 'when plane is not in airport' do
          it 'raises error' do
            expect { subject.request_take_off(plane) }.to raise_error AirportError
          end
        end
      end

      context 'when weather is stormy' do
        it 'raises error' do
          make_it_rain
          expect { subject.request_take_off(plane) }.to raise_error WeatherError
        end
      end
    end
  end
end
