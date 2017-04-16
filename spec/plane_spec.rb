require 'plane'

describe Plane do
  it { is_expected.to respond_to :land }

  # it 'lands a plane when given the instruction land' do
  #   airport = Airport.new
  #   expect(subject.land(airport)).to eq airport.planes
  # end

  it 'confirm that a plane has landed' do
    airport = Airport.new
    subject.land(airport)
    expect { subject.confirm_landed }.to output("The plane has landed\n").to_stdout
  end

  it 'confrim that a plane has not landed if it has not' do
    expect { subject.confirm_landed }.to output("The plane has yet to land\n").to_stdout
  end

  it 'every new instance of plane should have the capacity for passengers in an array' do
    expect(subject.passengers).to eq []
  end

  it { is_expected.to respond_to :take_off }

  it 'gets a plane to take off when given the instruction take_off' do
    expect(subject.take_off).to eq false
  end

  it 'confirm that a plane has taken off' do
    subject.take_off
    expect { subject.confirm_taken_off }.to output("The plane has taken off\n").to_stdout
  end

  it 'confirm that a plane has not taken off if it has not' do
    airport = Airport.new
    subject.land(airport)
    expect { subject.confirm_taken_off }.to output("The plane has yet to take off\n").to_stdout
  end

end
