require 'airport'

describe Airport do
    
    describe 'initialize' do
    end
        
    describe '#land' do
    it { is_expected.to respond_to (:land) }

    describe '#land()' do
    it 'should know when a plane has landed' do
    liverpool = Airport.new
    etihad = Plane.new
    liverpool.land(etihad)
    expect(subject.land(etihad).pop).to eq etihad
    end
    end
    end
end
