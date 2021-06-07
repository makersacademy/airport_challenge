require "./lib/plane.rb"

describe Plane do
  plane = Plane.new

  it "has been identified and command sent" do
    expect(plane).to respond_to(:land)
  end

    it "confirms that it has landed" do
     expect(plane.landed()).to be_an_instance_of Array
  end

  it "has been instructed to take off" do
    expect(plane).to respond_to(:take_off)
  end
  
  # it "is not is the aiport anymore" do
  #   expect(plane.take_off).to eq(nil)
  # end

end
