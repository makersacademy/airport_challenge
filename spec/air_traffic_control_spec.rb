describe AirTrafficControl do
  describe Airport do
    let(:plane) { instance_double(Plane, 'Plane') }

    describe '#capacity_guard' do
      context 'when weather is sunny' do
        before { let_there_be_sun }
        
        context 'when capacity is full' do
          before(:example) { 50.times { subject.planes << plane } }
          it 'raises capacity error' do
            expect { subject.send(:capacity_guard) }.to raise_error CapacityError
          end
        end

        context 'when capacity is nearly full' do
          before(:example) { 49.times { subject.planes << plane } }
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
          before(:example) { 50.times { subject.planes << plane } }
          it 'raises capacity error' do
            expect { subject.request_landing }.to raise_error CapacityError
          end
        end

        context 'when airport is not full' do
          it 'approves landing' do
            expect { subject.request_landing }.not_to raise_error
          end
        end
      end

      context 'when weather is stormy' do
        it 'raises weather error' do
          make_it_rain
          expect { subject.request_landing }.to raise_error WeatherError
        end
      end
    end

    describe '#request_take_off' do
      context 'when weather is sunny' do
        before(:example) { let_there_be_sun }

        context 'when plane is in airport' do
          before(:example) { subject.planes << plane }
          it 'approves take off' do
            expect { subject.request_take_off(plane) }.not_to raise_error
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

    describe '#weather_guard' do
      context 'when sunny' do
        it 'raises nothing' do
          let_there_be_sun
          expect { subject.send(:weather_guard) }.not_to raise_error
        end
      end

      context 'when stormy' do
        it 'raises error' do
          make_it_rain
          expect { subject.send(:weather_guard) }.to raise_error WeatherError
        end
      end
    end
  end
end

def let_there_be_sun
  allow(subject).to receive(:weather) { :sunny }
end

def make_it_rain
  allow(subject).to receive(:weather) { :stormy }
end
