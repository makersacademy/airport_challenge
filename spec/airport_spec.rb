require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  it "allows multiple planes to land" do
    plane = Plane.new
    expect(subject.planes[0]).to eq plane
  end


end



