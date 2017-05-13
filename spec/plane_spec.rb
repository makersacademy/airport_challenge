require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  it { is_expected.to respond_to :landed? }

  it "#initialize" do
    expect(plane.flight_status).to eq :flying
  end

  it "is landed when its flight status is landed" do
    plane.flight_status = :landed
    expect(plane.landed?).to eq true
  end

  it "is taken off when its flight status is taken off" do
    plane.flight_status = :taken_off
    expect(plane.taken_off?).to eq true
  end

  it "is not landed when it's flying" do
    plane.flight_status = :flying
    expect(plane.landed?).to eq false
  end

  it "is not landed when it's taken off" do
    plane.flight_status = :taken_off
    expect(plane.landed?).to eq false
  end

end
