require 'weather'

describe Weather do

  it "responds to generate weather" do

    # Weather should respond to generate
    expect(Weather).to respond_to(:generate)

  end

  it "ensure weather returns a string" do

    # Weather.generate should return an obect of type String
    expect(Weather.generate).to be_an_instance_of(String)

  end

  it "ensure sunny/stormy weather is generated at roughly 4:1" do

    # keep a record of the number of times each weather type has been returned
    sunny = 0 && stormy = 0

    # generate weather 1000 times, noting the return each time.
    # ensure the weather type is handled
    1.upto(1000) do
      this_weather = Weather.generate
      if this_weather == $sunny then sunny += 1
      elsif this_weather == $stormy then stormy += 1
      end
    end

    # sunny:stormy weather should be generated at roughly 4:1
    expect(stormy.between?(100, 300)).to eq(true)

  end

end
