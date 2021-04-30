require 'air_traffic_control.rb'
describe ATC do
  it { is_expected.to respond_to :check_weather }

  it { is_expected.to respond_to :land_plane }
end
