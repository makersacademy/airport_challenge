describe AirTrafficControl do
  describe Airport do
    let(:plane) { instance_double(Plane, 'Plane') }

    describe '#capacity_guard' do
      context 'when capacity is full' do
        before(:example) { 50.times { subject.planes << plane } }
        it 'raises error' do
          expect { subject.send(:capacity_guard) }.to raise_error CapacityError, CapacityError.new.msg
        end
      end

      context 'when capacity is nearly full' do
        before(:example) { 49.times { subject.planes << plane } }
        it 'raises nothing' do
          expect { subject.send(:capacity_guard) }.not_to raise_error
        end
      end
    end

    describe '#request_landing' do
      context 'when airport is not full' do
        it 'approves landing' do
          expect { subject.request_landing }.not_to raise_error
        end
      end

      context 'when airport is full' do
        before(:example) { 50.times { subject.planes << plane } }
        it 'raises error' do
          expect { subject.request_landing }.to raise_error CapacityError, CapacityError.new.msg
        end
      end
    end

    describe '#weather_guard' do
      context 'when sunny' do
        it 'raises nothing' do
          allow(subject).to receive(:weather) { :sunny }
          expect { subject.send(:weather_guard) }.not_to raise_error
        end
      end

      context 'when stormy' do
        it 'raises error' do
          allow(subject).to receive(:weather) { :stormy }
          expect { subject.send(:weather_guard) }.to raise_error WeatherError, WeatherError.new.msg
        end
      end
    end
  end
end
