class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:about_us ,:contact_us ]
  def index
  end

  def about_us
    render template: "static_pages/about_us"
  end

  def contact_us
    render template: "static_pages/contact_us"
  end

  def send_contact_us_mail
    ContactMailer.contact_us(params["name"], params["subject"], params["email"], params["message"]).deliver_now
    redirect_to root_path
  end

  def tutorial
    if params[:q]
      page = params[:page] || 1
      @results = GoogleCustomSearchApi.search(params[:q],
                                              page: page)
    else
      @results = GoogleCustomSearchApi.search('Photography',
                                              page: page)
    end
  end
end
