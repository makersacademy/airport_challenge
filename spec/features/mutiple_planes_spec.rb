# require 'airport'
#
# describe 'It can land/takeoff mutiple planes' do
#   subject(:airport) { described_class.new }
#   let(:plane) { double :plane1}
#   let(:plane) { double :plane2}
#   let(:plane) { double :plane3}
#   let(:plane) { double :plane4}
#   let(:plane) { double :plane5}
#   let(:plane) { double :plane6}
#   let(:plane) { double :plane7}
#   let(:plane) { double :plane8}
#   
#
#   before do
#     allow(plane).to receive(:landed?)
#     allow(plane).to receive(:landed).and_return(false)
#     allow(subject).to receive(:weather_check).and_return(false)
#     allow(plane).to receive(:airborn?)
#   end
#
# it 'Checks multiple planes landing and taking off' do
#   2.times {subject.call_land(Plane.new)}
#   allow(plane).to receive(:landed).and_return(true)
#   5.times {subject.takeoff(Plane.new)}
#   expect(subject.planes.length).to eq 5
# end
#
# end
