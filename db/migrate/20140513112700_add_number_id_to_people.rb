class AddNumberIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :number_id, :integer
  end
end
