require 'airport'

describe Airport do
  it 'is created and stores planes' do
    Airport.new
  end

  it 'responds to land command to let a plane land' do
    expect(subject).to respond_to :land
  end

  it 'lets a plane land, adds that plane to the array and returns it' do
    p a = Airport.new
    p p = Plane.new
    p a.land(p)
    p expect(subject.land(p)).to eq subject.planes
  end

  it { is_expected.to respond_to :takeoff }

  describe '#takeoff' do
    it 'lets a plane takeoff, removes that plane from the array and returns that plane' do
    p a = Airport.new
    p p = Plane.new
    p subject.land(p)
    expect(subject.takeoff(p)).to eq p
    # and to output("Plane has left the airport").to_stdout
   end
end

end
