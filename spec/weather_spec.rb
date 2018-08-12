require 'weather'

describe Weather do 
    subject(:weather) { described_class.new }  
    # let(:calmWeather) { double :weather, generate_conditions > 'Calm' }
    # let(:stormyWeather) { double :weather, generateconditions > 'Stormy' }

    describe '#initialize' do 
    end

    describe '#conditions_safe?' do 
        it { is_expected.to respond_to(:conditions_safe) }
        it 'checks if conditions are safe to manouevre' do
            allow(subject).to receive(:conditions_safe).and_return(true)
            expect(subject.conditions_safe).to eq(true)
        end   
    end

end
