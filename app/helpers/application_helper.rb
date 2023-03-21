module ApplicationHelper
  include Pagy::Frontend

  def available_categories
    Category.all.map do |category|
      [category.name.titleize, category.id]
    end
  end

  def available_sub_categories(category_id)
    SubCategory.where(category_id: category_id).all.map do |category|
      [category.name.titleize, category.id]
    end
  end

  def location_category(location)
    location.persisted? ? location.sub_category.category_id : Category.first.id
  end

  def location_sub_category(location, category_id)
    location.persisted? ? location.sub_category_id : SubCategory.where(category_id: category_id).first.id
  end

  def location_data_attributes
    { weblink: 'Weblink', trip_advisor: 'Tripadvisor', wikipedia: 'Wikipedia', facebook: 'Facebook', instagram: 'Instagram', city_weblink: 'City WebLink', city_trip_advisor: 'City Tripadvisor', city_facebook: 'City Facebook', city_instagram: 'City Instagram', train_timetable: 'Train Timetable', city_parkings: 'City Parkings', city_tourist_info: 'City Tourist Information', bank: 'Bank', cash: 'Cash', bus_stops: 'Bus Stops', local_police: 'Local Police', hospital: 'Hospital' }
  end
end
