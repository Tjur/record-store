ActiveAdmin.register Record do

  permit_params :name, :artist_id, :genre_id, :price, :release_year

  filter :name, :as => :string
  filter :artist
  filter :genre
  filter :release_year, :as => :numeric
  filter :price, :as => :numeric

  index do
    id_column
    column :cover do |record|
      album_cover_path = 'album covers/' + record.name.downcase.gsub(/\s/,'_') + '.jpg'
      album_cover_path = 'question_mark.png' if !File.exist?("#{Rails.root}/app/assets/images/" + album_cover_path)
      image_tag(album_cover_path, width: '40', height: '40')
    end
    column :name
    column :artist
    column :genre
    column :release_year
    column :price
    actions
  end

  show do
    attributes_table do
      row :cover do |record|
        album_cover_path = 'album covers/' + record.name.downcase.gsub(/\s/,'_') + '.jpg'
      album_cover_path = 'question_mark.png' if !File.exist?("#{Rails.root}/app/assets/images/" + album_cover_path)
      image_tag(album_cover_path, width: '200', height: '200')
      end
    row :id
    row :name
    row :artist
    row :genre
    row :release_year
    row :price
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
