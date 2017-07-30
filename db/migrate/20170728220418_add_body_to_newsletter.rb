class AddBodyToNewsletter < ActiveRecord::Migration[5.1]
  def change
    # add_column table_name, :column_name, :column_type
    add_column :newsletters, :body, :string
  end
end
