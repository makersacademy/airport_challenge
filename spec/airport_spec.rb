require "airport"

describe Airport do
  it "enables an airplane to land when instructed to" do 
    expect(subject).to respond_to :land_airplane
  end

  it "can instruct a plane to take off from an airport" do
    expect(subject). to respond_to :take_off_airplane 
  end

  it "confirms that an airplane has taken off" do
    expect(subject). to respond_to :check_airplane_status
  end

  it "checks that an airplane that has taken off, is no longer at the airport" do
    airplane = Airplane.new
    allow(airplane).to receive(:landed).and_return(false)
    subject.land_plane(airplane)
    allow(airplane).to receive(:landed).and_return(true)
    subject.take_off_airplane(airplane)
    expect(subject.airplanes).to_not include(airplane)
  end
end
