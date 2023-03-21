class AddCategoriesAndSubCategories < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        categories = {
          "places" => ["attractions", "museums", "statues", "religious buildings", "street art", "parks", "other"],
          "events" => ["music", "culture", "sports", "recreation", "auction", "exhibition", "other"],
          "nightlife" => ["nightclubs", "jazz clubs", "dance cafes", "adult"],
          "culture" => ["cinemas", "theatres", "concert halls"],
          "sport" => ["locations", "clubs", "other"],
          "eat" => ["restaurants", "brasserie", "fastfood"],
          "drink" => ["cafe", "brasserie", "tea-room", "popup bar", "lounge", "dance cafe", "other"],
          "shopping" => ["food", "shoes", "clothes"],
          "hotels" => ["1-star", "2-stars", "3-stars", "4-stars", "5-stars", "b&b", "hostel", "motel", "day hotel"]
        }

        # create categories and subcategories
        categories.each do |name, sub_categories|
          category = Category.create(name: name)
          sub_categories.each do |sub_category_name|
            category.sub_categories.create(name: sub_category_name)
          end
        end
      end
    end
  end
end
