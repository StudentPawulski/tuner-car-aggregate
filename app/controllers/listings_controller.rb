# frozen_string_literal: true

class ListingsController < ApplicationController
  def index
    @listings = Listing.order(:province).page(params[:page])
    @count = Listing.count
    @models = Model.all
    @makes = Make.all
    @provinces = Province.all

    @search = params['search']
    if @search.present?
      puts @search['title']
      puts @search['title']
      puts @search['title']
      puts @search['title']
      puts @search['title']
      puts @search['title']
      puts @search['title']
      puts @search['title']
      puts @search['title']
      @title = @search['title']
      @listings = Listing.where('title like ?', "%#{@title}%").page(params[:page])
      puts @listings
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end
end
