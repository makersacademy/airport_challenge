require 'weather'

describe Weather do

 it { is_expected.to respond_to :stormy? }
  
  # what is stormy?
  # describe stormy? do
    it "returns true when the weather is stormy" do
      
      expect(subject.stormy?).to eq true
    end
    # it "returns false when the number is between 1 and 75" do
    #   stormy? = (1..75)
    #   expect(stormy?)to eq false
    # end
  #end
  # end
end
