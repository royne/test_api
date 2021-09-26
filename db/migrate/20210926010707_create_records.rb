class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.text :arr, array: true, default: [] 

      t.timestamps
    end
  end
end
