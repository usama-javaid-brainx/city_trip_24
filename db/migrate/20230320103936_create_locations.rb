class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name, default: ''
      t.references :sub_category, null: false, foreign_key: true
      t.string :address, default: ''
      t.string :city, default: ''
      t.string :street, default: ''
      t.string :postal_code, default: ''
      t.string :number, default: ''
      t.string :country, default: ''

      t.jsonb :data, default: {}
      t.timestamps
    end
  end
end
