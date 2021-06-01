require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it 'lands a plane' do 
    @parked = []
    plane = Plane.new
    @parked << plane
    expect(subject.land(plane)).to eq @parked
  end

  it { is_expected.to respond_to :take_off } # (:take_off).with(1).argument }
  it 'takes off the plane that was landed' do
    plane = Plane.new
    @parked = []
    @parked << plane
    @parked.pop # (plane)
    expect(subject.take_off).to eq @parked
  end

end