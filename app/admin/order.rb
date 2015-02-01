ActiveAdmin.register Order do

  actions :index, :show, :edit, :destroy

  filter :created_at, :as => :date_range

  index do
    id_column
    column :user
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :products
      row :created_at
    end
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
