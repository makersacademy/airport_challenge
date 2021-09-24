# require 'plane'
# require 'airport'

# describe Plane do
#   it { is_expected.to respond_to :landing? }
#   it { is_expected.to respond_to :take_off }

#   it 'instructs the plane to delay landing if the weather is stormy' do
#     plane = subject.take_off
#     expect(plane).to eq "Landing delayed" if @weather == 'stormy'
#   end

#   it 'instructs the plane to land' do
#     plane = subject.take_off
#     expect(plane).to eq "Proceed to landing."
#   end
# end