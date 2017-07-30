class CreateNewsletters < ActiveRecord::Migration[5.1]
  def change
    create_table :newsletters do |t|
      t.string :subject
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
