class AddIntroToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :intro, :string
  end
end
