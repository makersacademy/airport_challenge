module AirTrafficControl
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
  end
end
