class AddStatusInPhrases < ActiveRecord::Migration[5.1]
  def change
    add_column :phrases, :status, :string, default: 'unread'
  end
end
