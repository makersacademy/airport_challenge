require 'weather'

describe Weather do 
    subject(:weather) { described_class.new }  
    # let(:calmWeather) { double :weather, generate_conditions > 'Calm' }
    # let(:stormyWeather) { double :weather, generateconditions > 'Stormy' }

    describe '#initialize' do 
    end

    describe '#generate_conditions' do 
        it { is_expected.to respond_to(:generate_conditions) }
        it "checks if weather is 'Calm' or 'Stormy'" do
            expect(subject.generate_conditions).to eq("Stormy").or eq("Calm")
        end   
    end

    describe '#conditions_safe?' do 
        it 'checks if conditions are safe to manouevre' do 
            allow(subject).to receive(:generate_conditions).and_return('Calm')
            expect(subject.conditions_safe?).to eq true
        end
    end

end
