require 'airport'

describe Airport do

end

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    let(:airport) { Airport.new }
    context 'when an airport is given as argument' do
      it 'returns the plane that just landed' do
        expect(subject.land(airport)).to eq subject
      end 
    end
  end
end
