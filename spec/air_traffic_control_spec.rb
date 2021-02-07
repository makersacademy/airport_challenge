# helper methods are defined in ./airport_test_setup_spec.rb
describe AirTrafficControl do
  describe Airport do
    let(:plane) { instance_double(Plane, 'Plane') }

    it { is_expected.to respond_to(:request_landing).with 1 }
    it { is_expected.to respond_to(:request_take_off).with 1 }

    describe '#capacity_guard' do
      context 'when weather is sunny' do
        before { let_there_be_sun }

        context 'when capacity is full' do
          before { fill_her_up }
          it 'raises capacity error' do
            expect { subject.send(:capacity_guard) }.to raise_error CapacityError
          end
        end

        context 'when capacity is nearly full' do
          before { 49.times { land_one } }
          it 'raises nothing' do
            expect { subject.send(:capacity_guard) }.not_to raise_error
          end
        end
      end
    end

    describe '#request_landing' do
      context 'when weather is sunny' do
        before(:example) { let_there_be_sun }

        context 'when airport is full' do
          before { fill_her_up }
          it 'raises capacity error' do
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
        before { make_it_rain }
        it 'raises weather error' do
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
        end

        context 'when plane is not in airport' do
          it 'raises error' do
            expect { subject.request_take_off(plane) }.to raise_error AirportError
          end
        end
      end

      context 'when weather is stormy' do
        before { make_it_rain }
        it 'raises error' do
          expect { subject.request_take_off(plane) }.to raise_error WeatherError
        end
      end
    end

    describe '#weather_guard' do
      context 'when sunny' do
        before { let_there_be_sun }
        it 'raises nothing' do
          expect { subject.send(:weather_guard) }.not_to raise_error
        end
      end

      context 'when stormy' do
        before { make_it_rain }
        it 'raises error' do
          expect { subject.send(:weather_guard) }.to raise_error WeatherError
        end
      end
    end

    describe '#clear_for_landing' do
      before { subject.send :clear_for_landing, plane }
      it 'adds the plane to the airport' do
        expect(subject.contain?(plane)).to be true
      end
    end

    describe '#clear_for_take_off' do
      before { subject.send :clear_for_landing, plane
               subject.send :clear_for_take_off, plane }
      it 'removes plane from airport' do
        expect(subject.contain?(plane)).to be false
      end
    end
  end
end
