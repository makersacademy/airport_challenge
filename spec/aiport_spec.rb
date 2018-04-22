require 'airport'

describe Airport do

    describe '#capacity method' do
      it 'should respond to #capacity' do
        expect(subject).to respond_to(:capacity)
      end

      it 'should have a default value for capacity' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it 'should allow the system designer to set capacity' do
        expect(described_class.new(20).capacity).to eq 20
      end
    end


end
