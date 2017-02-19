require 'airport'

describe Airport do

before(:each) do
  @plane = Plane.new
end

  it 'Lands a plane' do
    expect(subject.lands_plane(@plane)).to eq true
  end

  it 'Lets plane to take off' do
    expect(subject.take_off(@plane)).to eq false #take_off is actually self.land hence equals false here
  end

end
