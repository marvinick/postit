class CreateMigration < ActiveRecord::Migration
  def change
    create_table :migrations do |t|
    end
  end
end
