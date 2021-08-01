require 'weather.rb'

describe Weather do
  before(:each) do
    @subject = Weather.new
  end
  
  it { is_expected.to be_instance_of Weather } 
  it { is_expected.to respond_to(:stormy?) } 
end
