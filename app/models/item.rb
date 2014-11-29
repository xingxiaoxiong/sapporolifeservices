class Item < ActiveRecord::Base
    has_attached_file :photo, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

    has_many :comments
    belongs_to :user
end
