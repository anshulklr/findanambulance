class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
    	t.string :name
    	t.string :address
    	t.float :latitude
    	t.float :longitude
    	t.string :number
      t.timestamps
    end
  end
end
