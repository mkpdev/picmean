class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string     :alt,  default: ""
      t.string     :hint, default: ""
      t.attachment :file
      t.references :blog, foreign_key: true
      t.timestamps
    end
  end
end
