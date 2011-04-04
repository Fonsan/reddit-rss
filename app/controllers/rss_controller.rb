class RssController < ApplicationController
  def show
    cat = params[:category]
    render :layout => false, :text => Reddit.rss(cat).to_s
  end
end
