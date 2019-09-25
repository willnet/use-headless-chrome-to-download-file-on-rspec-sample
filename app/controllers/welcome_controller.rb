class WelcomeController < ApplicationController
  def index
  end

  def css
    send_data "hoge,fuga\n"
  end
end
