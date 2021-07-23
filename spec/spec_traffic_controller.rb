require 'traffic_controller'

describe TrafficController do
  it 'takes off an airplane' do
    expect(subject).to respond_to(:take_off)
  end

  #it "raises an error when trying to take off a plane that's already in the air" do
  #  A1 = Airplane.new()
  #  expect{subject.take_off(A1)}.to raise_error("Plane is currently flying.. 🛩")
  #end

  it 'lands an airplane' do
    expect(subject).to respond_to(:land_plane)
  end

  it 'rejects a airplane when it reaches max' do
    p @current_weather
    A1 = Airplane.new()
    subject.land_plane(A1)
    A2 = Airplane.new()
    subject.land_plane(A2)
    A3 = Airplane.new()
    expect(subject.land_plane(A3)).to eq ("Plane cannot land due to the max capacity being reached")
  end

  it 'prevents take off when storm' do
    A1 = Airplane.new()
  end
end
