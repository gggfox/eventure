# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  # falta agragar el rating como otro modelo
  # falta agragar las imagenes, talvex se agregue solo el nombre de la imagen
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :date
      t.text :desc
      t.integer :price

      t.timestamps
    end
  end
end
