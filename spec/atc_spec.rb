require 'air_traffic_control.rb'
describe ATC do
  describe '#check_weather' do
    it { is_expected.to respond_to :check_weather }
    
    #it 'raises an error when no weather report' do
     #   expect {subject.check_weather}.to raise_error 'No weather'
    #end
    
    it 'raises an error when it is stormy' do
        #stub that forces weather == 'stormy'
        expect {subject.check_weather}.to raise_error 'Storm warning'
    end
  end

  describe 'instructs planes to land' do
    it { is_expected.to respond_to :land_plane }
    # write a test here that expects "Can't land - too stormy" when weather  == stormy
  end

  describe 'instructs planes to takeoff' do
    it { is_expected.to respond_to :takeoff_plane }
    # write a test here that expects "Can't takeoff - too stormy" when weather  == stormy
  end
end
