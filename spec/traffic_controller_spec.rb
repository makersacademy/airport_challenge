require 'traffic_controller'

describe TrafficController do
  it '#plane instructed to land' do
    expect(subject.plane('land')).to eq("Roger, plane approaching runway for landing.")
  end
end
