class CreateDebtors < ActiveRecord::Migration
  def change
    create_table :debtors do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
