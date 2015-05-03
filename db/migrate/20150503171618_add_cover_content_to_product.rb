class AddCoverContentToProduct < ActiveRecord::Migration
  def change
    add_column :products, :content, :text
    add_column :products, :cover, :string
    add_column :products, :extension, :string
  end
end
