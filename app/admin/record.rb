ActiveAdmin.register Record do

  permit_params :artist, :genre, :price, :release_year

  filter :name, :as => :string
  filter :artist
  filter :genre
  filter :release_year, :as => :numeric
  filter :price, :as => :numeric

  index do
    id_column
    column :name
    column :artist
    column :genre
    column :release_year
    column :price
    actions
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

end
