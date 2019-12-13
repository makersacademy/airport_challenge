require 'airport'

describe Airport do
    it { is_expected.to respond_to :land }
  end
  describe Airport do
    it { is_expected.to respond_to :take_off }
  end
# describe Airport do
#   it 'expects landing planes' do
#     plane = Plane.new
#     # subject.land(plane)
#     expect(subject.plane).to eq plane
#   end
# end
