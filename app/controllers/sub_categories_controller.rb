class SubCategoriesController < ApplicationController

  def selected
    sub_categories = SubCategory.where(category_id: params[:category_id])
    render json: { sub_categories: sub_categories.map { |subcategory| { name: subcategory.name.titleize, id: subcategory.id } }, status: 200 }
  end

end
