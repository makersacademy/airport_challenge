require 'plane'


describe Plane do

  it {is_expected.to respond_to(:airbourne)}
  it {should respond_to(:landed)}
  it {should respond_to(:taken_off)}
  it 'plane is airbourne' do
    expect(subject.taken_off).to eq(subject.airbourne)
  end

  it 'plane has landed' do
    expect(subject.landed).to eq(subject.airbourne)
  end

end
