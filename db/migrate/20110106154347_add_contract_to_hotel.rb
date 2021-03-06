class AddContractToHotel < ActiveRecord::Migration
  def self.up
    add_column :hotels, :contract_file_name, :string # Original filename
    add_column :hotels, :contract_content_type, :string # Mime type
    add_column :hotels, :contract_file_size, :integer # File size in bytes
  end

  def self.down
    remove_column :hotels, :contract_file_name
    remove_column :hotels, :contract_content_type
    remove_column :hotels, :contract_file_size
  end
end
