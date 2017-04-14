require 'airport'

 describe Airport do

  it { is_expected.to respond_to :confirm_landed}
  it "confirms landing" do
    plane = Plane.new
    expect(subject.confirm_landed(plane)).to eq [plane]
  end
  end
