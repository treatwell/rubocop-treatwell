# frozen_string_literal: true

module RuboCop
  module Cop
    module Rails
      # Identifies calls to `unscoped` over non model constants. This can be an issue because
      # `unscoped` removes all scopes defined before. Calling it directly to the model, it
      # can be considered as safe because only `default_scope` will be removed, which is the
      # main reason to use `unscoped` statement.
      #
      # @example
      #   # bad
      #   User.where(trashed: true).unscoped.first
      #   User.trashed.unscoped.joins(:posts).where(posts: { trashed: true, title: 'Rails' }).first
      #   User.joins(:posts).where(posts: { trashed: true, title: 'Rails' }).unscoped.first
      #
      #   # good
      #   User.unscoped.where(trashed: true)
      #   User.unscoped.joins(:posts).where(posts: { trashed: true, title: 'Rails' })
      class UnscopedOverNonModelConstant < Base
        MSG = 'Prevent usage of `unscoped` over non model constants.'
        RESTRICT_ON_SEND = %i[unscoped].freeze

        def_node_matcher :unscoped_call?, <<~PATTERN
          (send _ :unscoped $...)
        PATTERN

        def on_send(node)
          return if node.receiver.respond_to?(:method_name) && _allowed_methods.include?(node.receiver.method_name.to_s)

          unscoped_call?(node) do
            next unless _unscoped_on_non_const?(node)

            range = node.loc.selector.with(end_pos: node.loc.expression.end_pos)

            add_offense(range)
          end
        end

        private

        def _unscoped_on_non_const?(node)
          !node.receiver.const_type?
        end

        def _allowed_methods
          cop_config['AllowedMethods'] || []
        end
      end
    end
  end
end
