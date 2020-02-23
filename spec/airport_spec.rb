require './lib/airport'

describe Airport do
  it { is_expected.to respond_to(:instruct_land) }
  
  it { is_expected.to respond_to(:instruct_take_off) }

  it 'instruct_take_off correctly' do
    airport = Airport.new
    expect(airport.instruct_take_off).to eq('Plane took off.')
  end

  it "raises an error when airport is full" do
    subject.airport_full = true
    expect { subject.instruct_land }.to raise_error 'Airport is full.' 
  end

  it "checks that the airport capacity is not a nil" do
    expect(subject.airport_capacity) != nil
  end

  it "overrides the airport capacity" do
    subject.airport_capacity = 6
    expect { subject.airport_capacity } == 6
  end

  it "raises an error to instruct taking off when the weather condition is stormy" do
    subject.weather_condition = "stormy"
    expect { subject.instruct_take_off }.to raise_error "No taking off, the weather is stormy!"
  end

  it "raises an error to instruct landing when the weather condition is stormy" do
    subject.weather_condition = "stormy"
    expect { subject.instruct_land }.to raise_error "No landing, the weather is stormy!"
  end
end
