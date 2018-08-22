class AddPhotoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_pic, :string, default: "http://www.clker.com/cliparts/B/R/Y/m/P/e/blank-profile-hi.png"
  end
end
