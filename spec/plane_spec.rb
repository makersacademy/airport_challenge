require 'plane'


describe Plane do

  describe :landed

  it {is_expected.to respond_to :landed}

  it "check if is landed" do
    plane = Plane.new
    plane.landed
    expect(@landed==true)
  end

    it "check if is not flying" do
    plane = Plane.new
    plane.landed
    expect(@flying==false)
  end


  describe :flying

  it {is_expected.to respond_to :flying}

  it "check if is flying" do
    plane = Plane.new
    plane.flying
    expect(@flying==true)
  end

  it "check if is not landed" do
    plane = Plane.new
    plane.flying
    expect(@landed==false)
  end

end
