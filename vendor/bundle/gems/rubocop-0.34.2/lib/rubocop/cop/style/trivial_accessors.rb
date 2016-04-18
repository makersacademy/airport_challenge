# encoding: utf-8

module RuboCop
  module Cop
    module Style
      # This cop looks for trivial reader/writer methods, that could
      # have been created with the attr_* family of functions automatically.
      class TrivialAccessors < Cop
        MSG = 'Use `attr_%s` to define trivial %s methods.'

        def on_def(node)
          return if in_module?(node)
          method_name, args, body = *node
          on_method_def(node, method_name, args, body)
        end

        def on_defs(node)
          return if in_module?(node)
          return if ignore_class_methods?
          _scope, method_name, args, body = *node
          on_method_def(node, method_name, args, body)
        end

        private

        def in_module?(node)
          pnode = node.parent
          pnode = pnode.parent if pnode && pnode.type == :begin
          !pnode.nil? && pnode.type == :module
        end

        def on_method_def(node, method_name, args, body)
          kind = if trivial_reader?(method_name, args, body)
                   'reader'
                 elsif trivial_writer?(method_name, args, body)
                   'writer'
                 end
          return unless kind

          add_offense(node, :keyword, format(MSG, kind, kind))
        end

        def exact_name_match?
          cop_config['ExactNameMatch']
        end

        def allow_predicates?
          cop_config['AllowPredicates']
        end

        def allow_dsl_writers?
          cop_config['AllowDSLWriters']
        end

        def ignore_class_methods?
          cop_config['IgnoreClassMethods']
        end

        def whitelist
          whitelist = cop_config['Whitelist']
          Array(whitelist).map(&:to_sym) + [:initialize]
        end

        def predicate?(method_name)
          method_name[-1] == '?'
        end

        def dsl_writer?(method_name)
          !method_name.to_s.end_with?('=')
        end

        def trivial_reader?(method_name, args, body)
          looks_like_trivial_reader?(args, body) &&
            !allowed_method?(method_name, body) &&
            !allowed_reader?(method_name)
        end

        def looks_like_trivial_reader?(args, body)
          args.children.size == 0 && body && body.type == :ivar
        end

        def trivial_writer?(method_name, args, body)
          looks_like_trivial_writer?(args, body) &&
            !allowed_method?(method_name, body) &&
            !allowed_writer?(method_name)
        end

        def looks_like_trivial_writer?(args, body)
          args.children.size == 1 &&
            ![:restarg, :blockarg].include?(args.children[0].type) &&
            body && body.type == :ivasgn &&
            body.children[1] && body.children[1].type == :lvar
        end

        def allowed_method?(method_name, body)
          whitelist.include?(method_name) ||
            exact_name_match? && !names_match?(method_name, body)
        end

        def allowed_writer?(method_name)
          allow_dsl_writers? && dsl_writer?(method_name)
        end

        def allowed_reader?(method_name)
          allow_predicates? && predicate?(method_name)
        end

        def names_match?(method_name, body)
          ivar_name, = *body

          method_name.to_s.sub(/[=?]$/, '') == ivar_name[1..-1]
        end

        def trivial_accessor_kind(method_name, args, body)
          if trivial_writer?(method_name, args, body) &&
             !dsl_writer?(method_name)
            'writer'
          elsif trivial_reader?(method_name, args, body)
            'reader'
          end
        end

        def accessor(kind, method_name)
          "attr_#{kind} :#{method_name.to_s.chomp('=')}"
        end

        def autocorrect(node)
          if node.type == :def
            autocorrect_instance(node)
          elsif node.type == :defs && node.children.first.type == :self
            autocorrect_class(node)
          end
        end

        def autocorrect_instance(node)
          method_name, args, body = *node
          unless names_match?(method_name, body) &&
                 !predicate?(method_name) &&
                 (kind = trivial_accessor_kind(method_name, args, body))
            return
          end

          lambda do |corrector|
            corrector.replace(node.loc.expression, accessor(kind, method_name))
          end
        end

        def autocorrect_class(node)
          _, method_name, args, body = *node
          unless names_match?(method_name, body) &&
                 (kind = trivial_accessor_kind(method_name, args, body))
            return
          end

          lambda do |corrector|
            indent = ' ' * node.loc.column
            corrector.replace(
              node.loc.expression,
              ['class << self',
               "#{indent}  #{accessor(kind, method_name)}",
               "#{indent}end"].join("\n")
            )
          end
        end
      end
    end
  end
end
