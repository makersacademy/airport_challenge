require 'weather'

describe Weather do

  it { is_expected.to respond_to(:safe?) }
  
  it "randomly generates a number between 0 and 10 " do
    allow_any_instance_of(Weather).to receive(:rand).and_return(1)
    allow_any_instance_of(Weather).to receive(:rand).and_return(4)
    allow_any_instance_of(Weather).to receive(:rand).and_return(8)
  end

#   it "returns false when it is not safe to fly" do
#     # create instance double with preset safe? method to false
#     weather = instance_double("Weather", :safe? => false)
#     # Weather.stub(:new) { storm }
#     # substitute Weather class with attribute
#     expect(weather.safe?).to eq false
#   end

#   it "returns true when it is safe to fly" do
#     # create instance double with preset safe? method to false
#     weather = instance_double("Weather", :safe? => true)
#     # substitute Weather class with attribute
#     # Weather.stub(:new) { storm}
#     expect(weather.safe?).to eq true
#   end
end
