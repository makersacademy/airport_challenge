class CountryCodes
  attr_reader :country_codes, :full_names
  def initialize
    @country_codes = ["AF", "AX", "AL", "DZ", "AS", "AD", "AO", "AI", "AQ", "AG",
                      "AR", "AM", "AW", "AU", "AT", "AZ", "BH", "BS", "BD", "BB",
                      "BY", "BE", "BZ", "BJ", "BM", "BT", "BO", "BQ", "BA", "BW",
                      "BV", "BR", "IO", "BN", "BG", "BF", "BI", "KH", "CM", "CA",
                      "CV", "KY", "CF", "TD", "CL", "CN", "CX", "CC", "CO", "KM", 
                      "CG", "CD", "CK", "CR", "CI", "HR", "CU", "CW", "CY", "CZ", 
                      "DK", "DJ", "DM", "DO", "EC", "EG", "SV", "GQ", "ER", "EE", 
                      "ET", "FK", "FO", "FJ", "FI", "FR", "GF", "PF", "TF", "GA", 
                      "GM", "GE", "DE", "GH", "GI", "GR", "GL", "GD", "GP", "GU", 
                      "GT", "GG", "GN", "GW", "GY", "HT", "HM", "VA", "HN", "HK", 
                      "HU", "IS", "IN", "ID", "IR", "IQ", "IE", "IM", "IL", "IT", 
                      "JM", "JP", "JE", "JO", "KZ", "KE", "KI", "KP", "KR", "KW", 
                      "KG", "LA", "LV", "LB", "LS", "LR", "LY", "LI", "LT", "LU", 
                      "MO", "MK", "MG", "MW", "MY", "MV", "ML", "MT", "MH", "MQ", 
                      "MR", "MU", "YT", "MX", "FM", "MD", "MC", "MN", "ME", "MS", 
                      "MA", "MZ", "MM", "NA", "NR", "NP", "NL", "NC", "NZ", "NI",
                      "NE", "NG", "NU", "NF", "MP", "NO", "OM", "PK", "PW", "PS", 
                      "PA", "PG", "PY", "PE", "PH", "PN", "PL", "PT", "PR", "QA", 
                      "RE", "RO", "RU", "RW", "BL", "SH", "KN", "LC", "MF", "PM", 
                      "VC", "WS", "SM", "ST", "SA", "SN", "RS", "SC", "SL", "SG", 
                      "SX", "SK", "SI", "SB", "SO", "ZA", "GS", "SS", "ES", "LK", 
                      "SD", "SR", "SJ", "SZ", "SE", "CH", "SY", "TW", "TJ", "TZ", 
                      "TH", "TL", "TG", "TK", "TO", "TT", "TN", "TR", "TM", "TC", 
                      "TV", "UG", "UA", "AE", "GB", "US", "UM", "UY", "UZ", "VU", 
                      "VE", "VN", "VG", "VI", "WF", "EH", "YE", "ZM", "ZW", "xx"]

    @full_names = ["Afghanistan", "Åland_Islands", "Albania", "Algeria",
                   "American_Samoa", "Andorra", "Angola", "Anguilla", 
                   "Antarctica", "Antigua_and_Barbuda", "Argentina", "Armenia",
                    "Aruba", "Australia", "Austria", "Azerbaijan", "Bahrain",
                    "Bahamas", "Bangladesh", "Barbados", "Belarus", "Belgium",
                    "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia",
                    "Bonaire", "Bosnia_and_Herzegovina", "Botswana", 
                    "Bouvet_Island", "Brazil", "British_Indian_Ocean_Territory", 
                    "Brunei_Darussalam", "Bulgaria", "Burkina_Faso", "Burundi", 
                    "Cambodia", "Cameroon", "Canada", "Cape_Verde", "Cayman_Islands", 
                    "Central_African_Republic", "Chad", "Chile", "China", 
                    "Christmas_Island", "Cocos_Islands", "Colombia", 
                    "Comoros", "Congo", "Democratic_Republic_of_the_Congo", 
                    "Cook_Islands", "Costa_Rica", "Côte_d_'Ivoire", "Croatia", 
                    "Cuba", "Curaçao", "Cyprus", "Czech_Republic", "Denmark", 
                    "Djibouti", "Dominica", "Dominican_Republic", "Ecuador", 
                    "Egypt", "El_Salvador", "Equatorial_Guinea", "Eritrea", 
                    "Estonia", "Ethiopia", "Falkland_Islands_(Malvinas)", 
                    "Faroe_Islands", "Fiji", "Finland", "France", 
                    "French_Guiana", "French_Polynesia", 
                    "French_Southern_Territories", "Gabon", "Gambia", 
                    "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", 
                    "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", 
                    "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", 
                    "Heard_Island_and_McDonald_Islands", "Holy_See_(Vatican_City_State)", 
                    "Honduras", "Hong_Kong", "Hungary", "Iceland", "India", "Indonesia", 
                    "Islamic_Republic_of_Iran", "Iraq", "Ireland", "Isle_of_Man", "Israel", 
                    "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", 
                    "Kiribati", "DPRK", "Republic_of_Korea", "Kuwait", "Kyrgyzstan", 
                    "Lao_Peoples_Democratic_Republic", "Latvia", "Lebanon", "Lesotho", 
                    "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macao", 
                    "Macedonia_the_Former_Yugoslav_Republic_of", "Madagascar", "Malawi", 
                    "Malaysia", "Maldives", "Mali", "Malta", "Marshall_Islands", "Martinique", 
                    "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia_Federated_States_of", 
                    "Moldova_Republic_of", "Monaco", "Mongolia", 
                    "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", 
                    "Nauru", "Nepal", "Netherlands", "New_Caledonia", "New_Zealand", 
                    "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk_Island", 
                    "Northern_Mariana_Islands", "Norway", "Oman", "Pakistan", "Palau", 
                    "Palestine_State_of", "Panama", "Papua_New_Guinea", "Paraguay", "Peru", 
                    "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto_Rico", "Qatar", 
                    "Réunion", "Romania", "Russian_Federation", "Rwanda", "Saint_Barthélemy", 
                    "Saint_Helena_Ascension_and_Tristan_da_Cunha", "Saint_Kitts_and_Nevis", 
                    "Saint_Lucia", "Saint_Martin_(French_part)", "Saint_Pierre_and_Miquelon", 
                    "Saint_Vincent_and_the_Grenadines", "Samoa", "San_Marino", "Sao_Tome_and_Principe", 
                    "Saudi_Arabia", "Senegal", "Serbia", "Seychelles", "Sierra_Leone", 
                    "Singapore", "Sint_Maarten_(Dutch_part)", "Slovakia", "Slovenia", 
                    "Solomon_Islands", "Somalia", "South_Africa", 
                    "South_Georgia_and_the_South_Sandwich_Islands", "South_Sudan", "Spain", 
                    "Sri_Lanka", "Sudan", "Suriname", "Svalbard_and_Jan_Mayen", "Swaziland", 
                    "Sweden", "Switzerland", "Syrian_Arab_Republic", "Taiwan_Province_of_China", 
                    "Tajikistan", "Tanzania_United_Republic_of", "Thailand", "Timor-Leste", 
                    "Togo", "Tokelau", "Tonga", "Trinidad_and_Tobago", "Tunisia", "Turkey", 
                    "Turkmenistan", "Turks_and_Caicos_Islands", "Tuvalu", "Uganda", "Ukraine", 
                    "United_Arab_Emirates", "United_Kingdom", "United_States", 
                    "United_States_Minor_Outlying_Islands", "Uruguay", "Uzbekistan", 
                    "Vanuatu", "Venezuela_Bolivarian_Republic_of", "Viet_Nam", 
                    "Virgin_Islands_British", "Virgin_Islands_U.S.", "Wallis_and_Futuna", 
                    "Western_Sahara", "Yemen", "Zambia", "Zimbabwe", "!!!This_Airport!!!"]
    end

    def search_by_name(country)
      raise('country not in list') if !@full_names.include?(country)
      index = @full_names.index(country)
      @country_codes[index]
    end

    def search_by_code(c_code)
      raise('code not in list') if !@country_codes.include?(c_code)
      index = @country_codes.index(c_code)
      @full_names[index]
    end
  end

