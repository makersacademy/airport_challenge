require 'air_traffic_control.rb'
describe ATC do
  describe 'checks the weather' do
    it { is_expected.to respond_to :check_weather }
    # test that checks if returns stormy when weather == stormy
  end

  describe 'instructs planes to land' do
    it { is_expected.to respond_to :land_plane }
    # test that expects "Can't land - too stormy" whne weather  == stormy
  end

  describe 'instructs planes to takeoff' do
    it { is_expected.to respond_to :takeoff_plane }
    # test that expects "Can't takeoff - too stormy" when weather  == stormy
  end
end
