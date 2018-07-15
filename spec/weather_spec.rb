
# require 'weather'

# describe Weather do
#   subject(:weather) {described_class.new}

#   describe 'changeable weather' do
#     it 'can storm' do
#       allow(Kernel).to receive(:rand).and_return 4
#       expect(weather.storm).to be true
#     end
#     it 'is a clear day' do
#       allow(Kernel).to receive(:rand).and_return 1
#       expect(weather.storm).to be false
#     end
#   end
#   # it 'is bad weather' do
#   #   if weather_now == 'bad'

#   # end
#   # it 'is good weather' do
#   #     allow(Kernel).to receive(:rand).and_return(weather_array)
#   #     expect(weather.stormy?).to be false
#   # end

#   # Kernel.stub!(:rand).and_return( *test_values )
# end
