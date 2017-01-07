require "airport"

describe Airport do

  it { is_expected.to respond_to :landed}

  it 'confirms a plane has landed' do
    plane = Plane.new
    subject.landed(plane)
    expect(subject.plane).to eq plane
  end

end
