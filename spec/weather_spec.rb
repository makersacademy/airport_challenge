require 'weather'

RSpec.describe Weather do
    it { should respond_to(:check_for_storm) }

    subject { Weather.new(0.1) }

    describe 'check_for_storm' do
        
        it 'Returns true if weather is stormy' do
            allow(subject).to receive(:rand).and_return(1)
            expect(subject.check_for_storm).to eq true
        end

        it 'Returns false if weather is calm' do
            allow(subject).to receive(:rand).and_return(10)
            expect(subject.check_for_storm).to eq false
        end
        
    end
    
end
