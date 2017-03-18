require 'airport'

describe Airport do
 let(:plane) { Plane.new }

  describe '#land' do
    it { is_expected.to respond_to(:land) }

    it 'instructs a plane to land at a specific airport and confirm it has landed' do
    expect(subject.land(plane)).to eq true
    end

  end



end
