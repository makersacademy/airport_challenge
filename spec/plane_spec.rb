require './lib/plane.rb'

describe Plane do

  it 'instructs plane to land in good weather' do
    subject{Airport.weather}
    if subject == 'sunny'
    expect(subject.land).to eq "Plane has been instructed to land"
    else
    expect(subject.land).to eq "Stormy weather: No plane must land."
  end
  end

  it "confirms that plane has taken off" do
    expect(subject.take_off).to be_truthy
    expect(subject.confirm_take_off).to eq "The plane has taken off and is no longer in the airport"
  end
end
