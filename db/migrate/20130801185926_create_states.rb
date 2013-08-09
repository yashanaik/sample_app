class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :statename
      t.string :countryname

      t.timestamps
    end
  end
end
