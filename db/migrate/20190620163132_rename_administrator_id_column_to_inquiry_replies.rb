class RenameAdministratorIdColumnToInquiryReplies < ActiveRecord::Migration[5.2]
  def change
  	rename_column :inquiry_replies, :administrator_id, :admin_id
  end
end
