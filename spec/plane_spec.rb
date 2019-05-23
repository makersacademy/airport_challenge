require_relative '../docs/plane'

describe Plane do
let(:plane) { Plane.new }

  it '.report_in_flight as true' do
    plane.report_in_flight
    expect(plane.flying).to eq(true)
  end

  it '.flying?' do
    plane.report_in_flight
    expect(plane.flying?).to eq(true)
  end
end
