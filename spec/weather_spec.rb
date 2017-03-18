require 'weather'

describe Weather do
  it 'expects an instance of the weather class' do
    expect(Weather.new.class).to eq Weather
  end
  # 
  # it "won't take off if the weather is stormy" do
  #   allow(conditions).to recieve(:take_off) {"stormy"}
  # end
end
