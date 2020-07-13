describe Plane do

  it { is_expected.to respond_to :landed }

  it "check to see if a new plane is at the Airport" do
    expect(subject.landed).to eq true
  end

end
