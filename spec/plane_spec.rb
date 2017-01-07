require 'plane'

describe Plane do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it { is_expected.to respond_to(:landed?) }
    
    it { is_expected.to respond_to(:take_off) }
    
    describe '#land' do
        it 'lands at airport' do
            airport = Airport.new
            expect(subject.land(airport)).to eq airport
        end
    end
    
    describe '#take_off' do
        it 'sets @landed to false' do
            airport = Airport.new
            subject.land(airport)
            subject.take_off
            expect(subject.landed?).to eq false
        end
    end
            
    describe '#landed?' do
        it 'returns true when landed' do
            airport = Airport.new
            subject.land(airport)
            expect(subject.landed?).to eq true
        end
        
        it 'returns false when not landed' do
            expect(subject.landed?).to eq false
        end
    end
    
end