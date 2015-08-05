class AddAttachmentDriverToIdentifications < ActiveRecord::Migration
  def self.up
    change_table :identifications do |t|
      t.attachment :driver
    end
  end

  def self.down
    remove_attachment :identifications, :driver
  end
end
