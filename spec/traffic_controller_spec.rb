require 'traffic_controller'

describe TrafficController do

  it "checks status of plane is grounded or in air" do
    expect(subject.status).to eq("grounded").or eq("in air")
  end

  it "If plane in air, instruct to land at an airport. If plane is grounded instruct to take off" do
    controller = TrafficController.new
    expect(subject.instruct).to eq("find an aiport to land at").or eq("time to take off!")
  end

  it "if airport capacity is full, prevent landing" do
    controller = TrafficController.new
    expect(controller.check_capacity).to eq("no landing here!").or eq("Airport is clear!")
  end

end