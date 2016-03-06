require 'airport'

describe Airport do
  it {is_expected.to respond_to(:land_plane).with(1).argument}
  it {is_expected.to respond_to(:take_off).with(1).argument}
  it {is_expected.to respond_to(:planes_in_hangar)}
  it {is_expected.to respond_to(:plane_status).with(1).argument}
  it {is_expected.to respond_to(:check_weather).with(1).argument}



  let(:plane) {double :plane}
  it 'should land a plane' do
    allow(plane).to receive_messages(landed: false)
    subject.land_plane(plane)
    expect(subject.hangar).not_to be_empty
  end



  it 'should takeoff a plane' do
    allow(plane).to receive_messages(takeoff: true)
    subject.take_off(plane)
    expect(subject.hangar).to be_empty
  end

  it 'should prevent takeoff if weather is bad' do
    expect{subject.take_off while true}.to raise_error(RuntimeError)
  end

  it 'should report on the status of the plane' do
    allow(plane).to receive_messages(flying?: true)
    expect(subject.plane_status(plane)).to be_truthy
  end
end
