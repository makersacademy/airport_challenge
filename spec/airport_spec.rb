require 'airport'

describe Airport do

  it {is_expected.to respond_to(:land).with(1).argument}


  it 'it allows planes to land' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq plane
  end


end



