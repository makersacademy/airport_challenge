require "air_controller"

describe Aircontroller do
  
  it "allows a plane to land in the airport" do
    expect(subject).to respond_to(:land).with(2).arguments
  end

end
