class HomeController < ApplicationController
  def index
  end

  def about_us
    render template: "static_pages/about_us"
  end

  def contact_us
    render template: "static_pages/contact_us"
  end

  def tutorial
    @results = GoogleCustomSearchApi.search("poker")
    byebug
  end
end
