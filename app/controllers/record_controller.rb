class RecordController < ApplicationController
  helper_method :sort_column, :sort_direction
  handles_sortable_columns

  def index
    @records = Record.all

    order = sortable_column_order do |column, direction|
      case column
        when "record_name" 
          "name #{direction}"
        when "artist_name"
          @records = @records.includes(:artist)
          "artist.name #{direction}"
        when "genre"
          @records = @records.includes(:genre)
          "genre.name #{direction}"
        when "release_year"
          "release_year #{direction}"
        when "price"
          "price #{direction}"
      end
    end

    @records = @records.search_(params[:search]).order(order).paginate(:per_page => 10, :page => params[:page])
  end

  def show
  end

  private
  
  def sort_column
    Record.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
