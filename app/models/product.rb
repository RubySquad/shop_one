class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01, allow_nil: true }
	validates :count, numericality: { greater_than: 0, allow_nil: true }
  has_attached_file :image,
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    :styles => { :small => "200x200>", :thumb => "75x75>" },
                    :default_url => 'Image_missing_:style.jpg'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :category_id, presence: true
  belongs_to :category
  belongs_to :producer
  belongs_to :retailer
end
