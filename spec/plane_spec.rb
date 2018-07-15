require 'plane'

describe Plane do
  # responds to basic methods
  it { is_expected.to respond_to :arrived? }
  it { is_expected.to respond_to :left? }

  # confirm takeoff
  it 'confirms that plane has left the airport' do
    expect(subject.left?).to be_truthy
  end
end
