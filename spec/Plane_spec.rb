require 'Plane'

describe Plane do

  it "it is flying on initialisation" do
    plane = Plane.new
    expect(plane.flying?).to eq true
  end

  it 'the plane lands' do
    plane = Plane.new
    expect { plane.land }
    .to change(plane, :flying?)
    .from(true).to(false)
  #  expect(subject.land).to respond_to(:land)
  end





end
