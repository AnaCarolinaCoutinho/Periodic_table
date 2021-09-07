class TableController < ApplicationController
  def index
    @elements = Element.all
  end
end
