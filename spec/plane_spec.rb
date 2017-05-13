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

  it "is not landed when its flying" do
    expect(plane.landed?).to eq false
  end

end
