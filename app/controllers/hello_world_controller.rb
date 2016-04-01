class HelloWorldController < ApplicationController
  skip_before_action :require_login

  def index
    @hello_world_props = { name: "Stranger" }
  end
end
