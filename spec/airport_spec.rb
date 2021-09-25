require 'airport'

describe Airport do
  it 'allows a plane to land' do
    expect(subject.land).to respond_to(:land).with(1).arguments
  end
end

# describe Airport do
# #   it { is_expected.to respond_to :took_off }
#   it { is_expected.to respond_to :permission_to_land }
# end

