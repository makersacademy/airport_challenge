require 'weather'

describe Weather do
  it 'should show that the weather class responds to the method weather condition' do
    expect(subject).to respond_to :weather_condition
  end

# this  is wrong! work on it!!
  it 'should show that weather condition will return either stormy or sunny' do
    Weather.any_instance.stub(:stormy => 1, :sunny => 2)
      weather_condition = Weather.new
      weather_condition.stormy.should eq(1)
      weather_condition.sunny.should eq(2)
    end


end
