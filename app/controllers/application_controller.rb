class ApplicationController < ActionController::Base
  autocomplete :item, :name, full: true
end
