# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/treatwell'
require_relative 'rubocop/treatwell/version'
require_relative 'rubocop/treatwell/inject'

RuboCop::Treatwell::Inject.defaults!

require_relative 'rubocop/cop/treatwell_cops'
