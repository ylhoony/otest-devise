module CountriesHelper

  def active_countries_list
    Country.active_countries 
  end

end
