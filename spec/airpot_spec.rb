require 'airport'

class Plane
end

describe Airport do



  it 'responds to the method land' do
    expect(subject).to respond_to :land
  end

  it 'allows a plane to land at airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end


end
