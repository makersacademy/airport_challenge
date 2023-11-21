require "./lib/planes.rb"
describe Planes do
  it "check that initial state of a plane in all parameters is :none" do 
    expect(subject.plane_now.find { |key, value| value != :none}).to eq(nil)
  end

  it "check that commence_procedure is a method of Planes" do
    expect(subject).to respond_to :commence_procedure
  end

  it "checks that commence_procedure sets parameter :airborne_request_land" do
    subject.commence_procedure(:airborne_request_land, :airborne_landing)
    expect(subject.plane_now[:airborne_request_land]).to eq(:now)
  end

  it "check that clean_state method will set all plane parameters to :none" do
    subject.commence_procedure(:airborne_request_land, :airborne_landing)
    subject.clean_state
    expect(subject.plane_now.find { |key, value| value != :none}).to eq(nil)
  end
end