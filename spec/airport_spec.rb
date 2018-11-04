require 'airport'

describe Airport do

  it "should instruct a plane to land at an airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end



  # it "instruct a plane to take off and confirm it is no longer in the airport" do
  #   plane = subject.take_off
  #   expect(plane)
  # end
end
