 require 'airport'
 require 'weather'

describe Weather do

    it 'prevents landing when weather is stormy' do
      subject.plane_land(Plane.new)
      expect { subject.plane_land Plane.new }.to raise_error 'weather is stormy'
    end

end

#
describe Airport do
#   # p described_class
#   # subject(:airport) { described_class.new}
#
#   # it 'responds to #plane_land' do
#   #   expect(subject).to respond_to(:plane_land)
#   # end
#
#
#   it 'responds to #weather_stormy' do
#     expect(subject).to respond_to(:weather_stormy)
#   end
#

    it 'raises an error when full' do
      subject.plane_land(Plane.new)
      expect { subject.plane_land Plane.new }.to raise_error 'airport is full'
    end


#
end
