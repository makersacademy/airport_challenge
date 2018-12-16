require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to :plane }

  context 'land' do
    it { is_expected.to respond_to :land }

    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'raises an error if plane attempts to land if airport is full ' do
      subject.land(Plane.new)
      expect { subject.land Plane.new }.to raise_error "Airport full"
    end

  end

  context 'take_off' do
    it { is_expected.to respond_to :take_off }

    it 'lets one plane take_off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end
end

# describe Airport do
#   it 'lands one plane' do
#     plane = Plane.new
#     subject.land_plane(plane)
#     expect(subject.land_plane(plane)).to eq plane
#   end
# end
