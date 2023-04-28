require_relative 'input_validator'
require_relative 'handle_data'
require_relative 'read_save_helper'

module Controller
  include InputValidator
  include ReadSaveHelper
end
