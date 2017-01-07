require 'plane'

describe Plane do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it { is_expected.to respond_to(:take_off) }
    
    it { is_expected.to respond_to(:landed) }
    
    it { is_expected.to respond_to(:airport) }
    
    subject { described_class.new }
    let(:airport) { double :airport }
    
    describe '#land' do
        before do
            subject.land(airport)
        end
        
        it 'changes @landed state to true' do
            expect(subject.landed).to eq true
        end
        
        it 'it returns the airport it has landed at' do
            expect(subject.airport).to eq airport    
        end
    end
    
    describe '#take_off' do
        before do
            subject.land(airport)
            subject.take_off
        end
        
        it 'sets @landed to false' do
            expect(subject.landed).to eq false
        end
        
        it 'sets current airport to flying' do
            expect(subject.airport).to eq :flying
        end
    end
    
=begin
    describe '#landed?' do
        it 'returns true when landed' do
            subject.land(airport)
            expect(subject.landed?).to eq true
        end
        
        it 'returns false when not landed' do
            expect(subject.landed?).to eq false
        end
    end
=end  

end