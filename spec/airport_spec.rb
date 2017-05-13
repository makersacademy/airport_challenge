require 'airport'
describe Airport do

  subject(:airport) { Airport.new }
  it { is_expected.to respond_to(:land).with(1).argument  }
  
  it 'should be able let a plane land' do
  	 
  end

end
