require 'airport'

describe Airport do
    
      it { is_expected.to respond_to(:land) }
    
      it { is_expected.to respond_to(:takeoff) }
    
      it 'raises an error if stormy weather' do
        expect {subject.takeoff}.to raise_error 'planes cannot takeoff'
      end

      it 'raises an error if stormy weather' do
        expect {subject.land}.to raise_error 'planes cannot land'
      end
  
    describe '#max' do
      it 'raises an error when full' do
        Airport::DEFAULT_CAPACITY.times do
          subject.max Plane.new
        end
        expect { subject.max Plane.new }.to raise_error 'Airport full'
      end
    end

end

