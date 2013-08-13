class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :parentname

      t.timestamps
    end
  end
end
