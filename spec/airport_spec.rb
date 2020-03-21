require 'airport'

describe Airport do
  #subject { Plane.new } 

  it { is_expected.to respond_to :land }

  it "expects one argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end
end
