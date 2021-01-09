require 'airport'

describe Airport do
  it { is_expected.to respond_to(:contains?).with(1).argument}
end

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  let(:airport) { Airport.new }

  describe '#land' do
    context 'when an airport is given as argument' do
      it 'returns the plane that just landed' do
        expect(subject.land(airport)).to eq subject
      end
    end
  end

  describe '#take_off' do

  end

end
