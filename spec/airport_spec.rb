require 'airport'

describe Airport do
    
      it { is_expected.to respond_to(:land) }
    
      it { is_expected.to respond_to(:takeoff) }
    
      it 'raises an error if stormy weather' do
        expect {subject.takeoff}.to raise_error 'planes cannot takeoff'
      end

  
    
end

