require 'traffic_controller'

describe TrafficController do
  it 'takes off an airplane' do
    expect(subject).to respond_to(:take_off)
  end

  it "raises an error when trying to take off a plane that's already in the air" do
    A1 = Airplane.new()
    subject.take_off(A1)
    expect{subject.take_off(A1)}.to raise_error("Plane is currently flying.. 🛩")
  end
end
