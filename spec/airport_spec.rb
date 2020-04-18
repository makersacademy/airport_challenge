require 'airport'

describe Airport do
    
  it "can show if it's full" do
    expect(subject).to respond_to :is_full?      
  end
    
end