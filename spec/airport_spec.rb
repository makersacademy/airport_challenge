require './lib/airport.rb'

describe Airport do
  boeing747 = Plane.new

  it { should respond_to(:land, :take_off, :confirmation_of_departure) }
  it { expect(subject.land(boeing747)).to eq [boeing747] }
  it { expect(subject.take_off(boeing747)).to eq [] }
  it do
    subject.land(boeing747)
    expect { subject.confirmation_of_departure(boeing747) }.to raise_error("The #{boeing747} did not take off")
  end
  it do
    subject.land(boeing747)
    subject.take_off(boeing747)
    expect(subject.confirmation_of_departure(boeing747)).to eq nil
  end

end
