require 'airport'
require 'plane'


describe Airport do



  it 'allows a plane to land' do
    is_expected.to respond_to (:land)
  end 

  it 'allows a plane to take off' do
    is_expected.to respond_to(:takeoff).with(1).argument
  end 



end