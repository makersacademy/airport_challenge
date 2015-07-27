require 'airport'
 
# describe Airport do
#   subject { Airport.new weather: weather, capacity: capacity }
#   let(:capacity) { 10 }
#   let(:weather_sym) { :nice }
#   let(:weather) do
#     double :to_sym => weather_sym 
#   end
 
#   describe "#to_sym" do
#     context "when weather is stormy" do
#       let(:weather_sym) { :stormy }
#       it "is operating" do
#         expect(subject.to_sym).to eq :closed
#       end
#     end
 
#     context "when airport is full" do
#       let(:capacity) { 0 }
#       it "is operating" do
#         expect(subject.to_sym).to eq :closed
#       end
#     end
 
#     context "when weather is OK and the airport is not full" do
#       it "is operating" do
#         expect(subject.to_sym).to eq :operating
#       end
#     end
#   end
 
#   describe "#notified_take_off" do
#     it 'reduces the capacity by 1' do
#       expect { subject.notified_take_off }.to change{ subject.capacity}.by(1)
#     end
#   end
# end

