require 'airport'

describe Plane do

  it { is_expected. to respond_to(:land).with(1).argument }

  it { is_expected. to respond_to(:take_off).with(1).argument }

  it 'confirms plane has taken off' do
    heathrow = Airport.new
    expect(subject.take_off(heathrow)). to eq("Plane has taken off")
  end

end
