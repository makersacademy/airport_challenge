require 'airport'

describe Airport do
  describe Plane do
    it { is_expected.to respond_to(:initiate) }
  end
  it "can create a plane" do
    expect(subject).to be_instance_of(Airport)
  end
  it 'can allow a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it 'can confirm plane landed on airport' do
    plane = Plane.new
    expect(subject.land(plane)).to include plane
  end
  it 'can allow a plane to take off' do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end
  it 'can prevent a plane to take off if no planes' do
    plane = Plane.new
    expect { subject.takeoff(plane) }.to raise_error('No planes scheduled for departure')
  end
  it 'can prevent a plane from landing if full?' do
    20.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error('Airport Full,landing forbiden')
  end
end
