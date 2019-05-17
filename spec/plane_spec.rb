require_relative '../docs/plane'

describe Plane do
let(:plane) { Plane.new }

  it 'responds to .report_in_flight' do
    expect(plane).to respond_to(:report_in_flight)
  end

  it '.flying?' do
    expect(plane.flying?).to eq(true)
  end
end
