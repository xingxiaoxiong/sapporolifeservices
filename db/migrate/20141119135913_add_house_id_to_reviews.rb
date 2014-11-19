class AddHouseIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :house_id, :integer
  end
end
