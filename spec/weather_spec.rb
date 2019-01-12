require 'weather'

describe Weather do
  it { is_expected.to be_an_instance_of(Weather) }

  it "should randomly generate weather state between 1 and 2" do
    expect(subject.state).to be_between(1, 2)
  end
end
