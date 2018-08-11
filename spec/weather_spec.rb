require 'weather'

describe Weather do 
    subject(:weather) { described_class.new }  
    # let(:calmWeather) { double :weather, generate_current_conditions > 'Calm' }
    # let(:mockPlane) { double :plane } 

    describe '#initialize' do 
    end

    describe '#generate_current_conditions' do 
        it { is_expected.to respond_to(:generate_current_conditions) }
        it "checks if weather is 'Calm' or 'Stormy'" do
            expect(subject.generate_current_conditions).to eq("Stormy").or eq("Calm")
        end   
    end

    describe '#current_conditions_safe?' do 
        it 'checks if conditions are safe to manouevre' do 
            allow(subject).to receive(:generate_current_conditions).and_return('Calm')
            expect(subject.current_conditions_safe?).to eq true
        end
    end

end
