require 'airport'

describe Airport do
    
  it "can show if it's full" do
    expect(subject).to respond_to :is_full?      
  end
    
  it { is_expected.to respond_to(:land).with(1).argument }
  
  it { is_expected.to respond_to(:take_off).with(1).argument }
  
  
  
end