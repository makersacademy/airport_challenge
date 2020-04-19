
require 'weather.rb'

describe Weather do
  
  it { is_expected.to respond_to :is_stormy? }
  
  describe "#is_stormy?" do
    it "shows the weather is stormy" do
       srand 0.1
       allow(subject).to receive(:is_stormy?) { true }
    end
    
    it "shows the weather is fine" do
       srand 0.6
       allow(subject).to receive(:is_stormy?) { false }
    end
    
  end
end 