# require "weather"
#
# describe Weather do
#   describe "safe_to_land?" do
#     it "returns stormy if weather is stormy" do
#       allow(subject).to receive(:rand_weather) {"stormy"}
#       expect(subject.rand_weather).to eq("stormy")
#     end
#     it "returns sunny if weather is sunny" do
#       allow(subject).to receive(:rand_weather) {"sunny"}
#       expect(subject.rand_weather).to eq("sunny")
#     end
#   end
# end
