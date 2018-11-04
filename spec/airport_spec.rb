require 'airport'

describe Airport do

  it "should instruct a plane to land at an airport" do
    expect(subject.instruct_land).to eq_to true
  end

  it "instruct a plane to take off and confirm it is no longer in the airport" do
    status = subject.plane_is_in_airport
    expect(status).to eq_to true
    subject.instruct_take_off
    status = subject.plane_is_in_airport
    expect(status).to eq_to false
  end


end
