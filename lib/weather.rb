module Weather

  @@wx_options = ["stormy", "sunny", "sunny", "sunny", "sunny"]

  def weather
    @@wx_options.sample
  end

  def stormy?
    weather == "stormy"
  end

  def update_weather(weather)
    @@wx_options = @@wx_options.select { |wx_option| wx_option == weather }
  end

end
