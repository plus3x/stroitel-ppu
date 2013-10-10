class CreateSeoMeta < ActiveRecord::Migration
  def change
    create_table :seo_meta do |t|
      t.belongs_to :service
      t.belongs_to :type_of_product
      t.belongs_to :products
      t.string :keywords
      t.string :description

      t.timestamps
    end
  end
end
