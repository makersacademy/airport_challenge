require 'traffic_controller'

describe TrafficController do
  it 'prevents take off when stormy' do
    A1 = Airplane.new()
    allow(subject).to receive(:weather).and_return true
    expect {subject.take_off(A1)}.to raise_error 'Plane cannot fly due to stormy weather!.. 🛩'
   end
 end
