ActiveAdmin.register Order do
  permit_params :status

  actions :index, :show, :edit, :update, :destroy

  filter :created_at, :as => :date_range

  index do
    id_column
    column :user
    column :status do |order|
      order.status.humanize
    end
    column :total do |order|
      order.total.to_s + '0 zł'
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :status do |order|
        order.status.humanize
      end
      #row :products do |order|
      #  order.products
      #end
      row :total do |order|
        order.total.to_s + '0 zł'
      end
      row :created_at
    end
  end

  form do |f|
    f.inputs "Order Details" do
      f.input :status, as: :select, include_blank: false, collection: Order.statuses.keys.map{ |status| [status.humanize, status] }
    end
    f.actions
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
