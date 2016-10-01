require 'airport'

describe Airport do
  before :example do
    @plane = Plane.new
  end

  it 'lands a plane at an airport' do
    expect(subject.land(@plane)).to eq [@plane]
  end

  it 'confirms that a plane has landed' do
    subject.land(@plane)
    expect(subject.planes).to eq [@plane]
  end
end
