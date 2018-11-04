require 'airport'

describe Airport do

  it "should instruct a plane to land at an airport" do
    expect(subject.instruct_land).to eq_to true
  end

  it "instruct a plane to take off and confirm it is no longer in the airport" do
    expect(subject.plane_is_in_airport).to eq_to true
    subject.instruct_take_off
    expect(subject.plane_is_in_airport).to eq_to false
  end

  it "should prevent take off when weather is stormy" do





    # subject.set_stormy(true)
    # expect(subject.plane_is_in_airport).to eq_to true
    # subject.instruct_take_off
    # expect(subject.plane_is_in_airport).to eq_to true
  end

  it "should prevent landing when weather is stormy" do




    # subject.set_stormy(true)
    # expect(subject.plane_not_in_airport).to eq_to false
    # subject.instruct_land
    # expect(subject.plane_not_in_airport).to eq_to false
  end

  it "should prevent a plane landing when airport is full" do

  end

end
