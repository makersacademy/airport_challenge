require "plane"

describe Plane do

  it "is able to land" do
    expect(subject).to respond_to(:land)
  end

  it "should recognise when not in flight" do
    expect(subject.land).to be(false)
  end


end


#allow(@bike).to receive(:working?).and_return(true)
