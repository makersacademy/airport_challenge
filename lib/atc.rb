require_relative 'plane'

module ATC

  def confirm_weather
    ["sunny", "sunny", "stormy", "sunny"].sample
  end

  def land_plane
    "land plane at airport"
  end

  def take_off_plane
    "prepare plane for take-off"
  end

  def confirm_take_off
    "plane is no longer at the airport"
  end

  def cancel_take_off
    "plane cannot take off"
  end

  def cancel_landing
    "plane cannot land"
  end
end
