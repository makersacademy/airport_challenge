require 'airport'
require 'plane'


describe Airport do
    let(:plane) { double :plane }
    let(:weather) { double :weather }
  it 'planes can land at the airport' do
    allow(subject).to receive(:todays_weather) { 0 }
    expect(subject.receive_plane(:plane)). to eq :plane
  end
  it 'planes can take off from the airport' do
    allow(subject).to receive(:todays_weather) { 0 }
    subject.receive_plane(:plane)
    expect(subject.plane_take_off(:plane)). to eq "The plane has taken off"
  end
  it 'planes will not land if the airport is full' do
    allow(subject).to receive(:todays_weather) { 0 }
    subject.receive_plane(:plane)
    expect { Airport::DEFAULT_CAPACITY.times {subject.receive_plane(:plane)} }.to raise_error 'The plane cannot land because the airport is full'
  end
  it 'planes will not take off from this airport if they landed at a different airport' do
    allow(subject).to receive(:todays_weather) { 0 }
    subject.receive_plane(:plane)
    airport2 = Airport.new
    allow(airport2).to receive(:todays_weather) { 0 }
    expect{airport2.plane_take_off(:plane)}.to raise_error 'The plane is not at this airport'
  end
it 'check stub is working' do
  allow(subject).to receive(:todays_weather) { 1 }
  expect(subject.todays_weather).to eq 1
end

#   it 'planes will not take off in stormy weather' do
#     allow(subject).to receive(:todays_weather) { 0 }
#     subject.receive_plane(:plane)
#     allow(subject).to receive(:todays_weather) { 1 }
#     subject.plane_take_off(:plane)
#     expect {subject.plane_take_off(:plane)}.to raise_error 'The plane cannot take off due to storms'
#   end
# it 'planes will not land in stormy weather' do
#     allow(subject).to receive(:todays_weather) { 1 }
#     expect {subject.receive_plane(plane)}.to raise_error 'The plane cannot land due to storms'
#   end

end
