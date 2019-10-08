# frozen_string_literal: true

class ListingsController < ApplicationController
  def index
    @listings = Listing.order(:province).page(params[:page])
    @count = Listing.count
    @models = Model.all
    @makes = Make.all
    @provinces = Province.all
  end

  def show
    @listing = Listing.find(params[:id])
  end
end
