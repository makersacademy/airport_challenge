require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'lands the plane' do
    plane = @plane
    expect(subject.land(plane)).to match_array([@at_the_airport])
  end

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'allows the plane to takeoff' do
    @at_the_airport = []
    plane = @at_the_airport << @plane
    subject.land(plane)
    expect(subject.takeoff(plane)).not_to include(plane)
  end
  it 'announces which plane has taken off' do
    expect { subject.confirm_takeoff }.to output('plane has taken off').to_stdout
  end

end
