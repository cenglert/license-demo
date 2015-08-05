class Identification < ActiveRecord::Base
  has_attached_file :driver, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :driver, :content_type => /\Aimage\/.*\Z/
end
