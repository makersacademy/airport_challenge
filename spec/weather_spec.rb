require 'weather'

describe Weather do
  it 'should test that the weather class responds to the method weather condition' do
    expect(subject).to respond_to :weather_condition
  end

  it 'should test that weather class responds to weather_rand' do
    expect(subject).to respond_to :weather_rand
  end

  it "should test that weather condition will be stormy when weather rand returns 1" do
    subject.stub(:weather_rand).and_return(1)
    expect(subject.weather_condition(1)).to eq :stormy
  end

  it "should test that weather conditions will be stunny when weather rand returns 2" do
    subject.stub(:condition).with(2).and_return(:sunny)
    expect(subject.weather_condition(2)).to eq :sunny
  end

end
