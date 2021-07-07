class Product < ActiveRecord::Base

  def show_photo
    "#{photo}"
  end

end
