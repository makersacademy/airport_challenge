class Weather


  def weather_report
     weather = rand
      if weather < 0.1
       stormy?
     end
   end

  def stormy?
    true
  end

end
