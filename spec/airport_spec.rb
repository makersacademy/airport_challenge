require 'airport'
describe Airport do
    it {is_expected.to respond_to(:land)}
    it {is_expected.to respond_to(:take_off)}
    
    describe '#take_off' do
        it 'tells a plane take_off' do
            boeing = Plane.new
            subject.land(boeing)
            expect(subject.take_off).to eq boeing
        end
    end
    
    describe '#land' do
        it 'tells a plane to land' do
            boeing = Plane.new
            expect(subject.land(boeing)).to eq [boeing]
        end
    end
    
end