require 'airport'

describe Airport do
  before :example do
    @plane = Plane.new
  end

  it 'instructs a plane to land at an airport' do
    expect(subject.land(@plane)).to eq [@plane]
  end

  it 'confirms that a plane has landed' do
    subject.land(@plane)
    expect(subject.planes).to eq [@plane]
  end

  it 'instructs a plane to take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'confirms that a plane has took off' do
    subject.land(@plane)
    expect(subject.take_off).to eq @plane
  end
end
