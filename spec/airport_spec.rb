require 'airport'

describe Airport do

  it { is_expected.to respond_to(:plane_landing).with(1).arguments }

  it { is_expected.to respond_to(:plane_takeoff).with(1).arguments }

  it 'does not allow planes to land when the airport is full' do
    Airport::DEFAULT_CAPACITY.times do
      subject.plane_landing(:plane)
    end
    expect { subject.plane_landing(:plane) }.to raise_error 'Cannot land plane: Airport is full'
  end

end
