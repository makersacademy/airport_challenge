require 'plane'


describe Plane do

  it 'plane is airbourne' do
    expect(subject.taken_off).to eq(subject.airbourne)
  end

  it 'plane has landed' do
    expect(subject.landed).to eq(subject.airbourne)
  end

end
