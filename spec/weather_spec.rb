require 'weather.rb'

describe Weather do
  let(:weather) {Weather.new}
  let(:weather_stormy) {instance_double('Weather', :stormy? => true, :stormy => true)}
  it 'can generate whether conditions are stormy' do
    expect(weather.report(1)).to eq 'stormy'
  end
 
  #TODO come up with a way to test this
  # it 'can randomly generate the weather conditions' do
  #   expect(weather.stormy).to eq true
  # end
end