class CreateHospitaldata < ActiveRecord::Migration
  def change
    create_table :hospitaldata do |t|
    	t.string :url	
      t.timestamps
    end
  end
end
