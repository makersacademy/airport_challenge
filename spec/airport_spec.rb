require 'airport'
require 'weather'

describe Airport do
it { is_expected.to respond_to(:confirm_landing).with(1).argument}
it { is_expected.to respond_to(:confirm_takeoff).with(1).argument}
end

define '#confirm_landing' do
plane=Plane.new
expect(subject.confirm_landing(plane)).to eq plane 
end

define '#confirm_takeoff' do

end
