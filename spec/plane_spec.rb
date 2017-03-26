

describe Plane do

  it '#land instructs planes to land' do
    subject.land
    expect(subject).to be_landed
  end

  it '#landed? confirms planes have landed' do
    subject.land
    expect(subject.landed?).to eq(true)
  end

  it '#takeoff means planes are no longer landed' do
    subject.takeoff
    expect(subject.landed?).to eq(false)
  end

end
