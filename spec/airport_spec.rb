require 'airport'

describe Airport do

  it { is_expected.to respond_to(:plane_landing).with(1).arguments }

  it { is_expected.to respond_to(:plane_takeoff).with(1).arguments }

  it 'does not allow planes to land when the airport is full' do
    plane = double :plane
    # here we are making sure we can add the maximum number of planes and it will not break
    expect { Airport::DEFAULT_CAPACITY.times { subject.plane_landing(plane) } }.to_not raise_error
    # :plane is being used as a double because we havnt explicitly defined what a plane is yet
    # here we are adding the final plane hoping that it will break
    expect { subject.plane_landing(plane) }.to raise_error 'Cannot land plane: Airport is full'
  end



end
