class Admins::SeachesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == '1'
      @clients = Client.with_deleted.search(@word)
    elsif @range == '2'
      @products = Product.search(@word)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end