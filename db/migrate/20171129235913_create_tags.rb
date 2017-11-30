class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.column :image_id, :integer
      t.column :title, :string

      t.timestamps
    end
  end
end
