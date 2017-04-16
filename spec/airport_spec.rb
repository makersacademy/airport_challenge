require 'airport'

 describe Airport do

  it { is_expected.to respond_to :confirm_landed}
  it { is_expected.to respond_to :confirm_take_off}
  it { is_expected.to respond_to :weather_status  }

  it "confirms landing" do
    plane = Plane.new
    expect(subject.confirm_landed(plane)).to eq [plane]
  end

  it "confirms take off" do
    plane= Plane.new
    subject.confirm_landed(plane)
    expect(subject.confirm_take_off).to eq plane
  end


  end
