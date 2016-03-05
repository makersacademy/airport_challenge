require 'airport'

describe Airport do
  it {is_expected.to respond_to(:land_plane).with(1).argument}
  it {is_expected.to respond_to(:planes_in_hangar)}


  let(:plane) {double :plane}
  it 'should land a plane' do
    allow(plane).to receive_messages(landed: false)
    subject.land_plane(plane)
    expect(subject.hangar).not_to be_empty
  end

end
