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
    @record = Record.find(params[:id])
  end

  def add
    session[:basket_id] ||= Basket.create.id
    record = Record.find(params[:id])
    Basket.find(session[:basket_id]).update(products: Basket.find(session[:basket_id]).add(record))
    redirect_to records_path
  end
end
