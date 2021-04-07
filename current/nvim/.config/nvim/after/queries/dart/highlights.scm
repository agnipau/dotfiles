; TODO(agnipau):
(dotted_identifier_list) @error

; Method call
((identifier)
 (selector (assignable_selector (unconditional_assignable_selector (identifier) @method)))
 .
 (selector (argument_part (arguments))))

; Function call
((identifier) @function
 .
 (selector (argument_part (arguments))))

; Annotation
(annotation name: (identifier) @attribute)
(marker_annotation name: (identifier) @attribute)

; Template string
(template_substitution
 "$" @punctuation.special
 "{" @punctuation.special
 "}" @punctuation.special)

(template_substitution (identifier) @variable)

(template_substitution
 "$" @punctuation.special
 (identifier_dollar_escaped) @variable)

; String
(escape_sequence) @string.escape
(string_literal) @string

; Operator
["@"
 "=>"
 ".."
 "??"
 "=="
 "?"
 ":"
 "&&"
 "%"
 "<"
 ">"
 "="
 ">="
 "<="
 "||"
 (increment_operator)
 (is_operator)
 (prefix_operator)
 (equality_operator)
 (additive_operator)] @operator

; Punctuation
["("
 ")"
 "["
 "]"
 "{"
 "}"]  @punctuation.bracket

[";"
 "."
 ","] @punctuation.delimiter

; Type
(class_definition name: (identifier) @type)
(constructor_signature name: (identifier) @type)
(function_signature name: (identifier) @method)
(getter_signature (identifier) @method)
(setter_signature name: (identifier) @method)
(enum_declaration name: (identifier) @type)
(enum_constant name: (identifier) @type)
(type_identifier) @type
(void_type) @type
(scoped_identifier scope: (identifier) @type)
("Function" @type)

((scoped_identifier
  scope: (identifier) @type
  name: (identifier) @type)
 (#match? @type "^[a-zA-Z]"))

((identifier) @type
 (#match? @type "^_?[A-Z]"))

; Variable declarations
[(inferred_type) ; var keyword
 (const_builtin)
 (final_builtin)] @keyword

; Properties
(assignable_selector (identifier) @property)

; Assignments
(assignment_expression left: (assignable_expression) @variable)

; Parameters
(formal_parameter name: (identifier) @parameter)
(named_argument (label (identifier) @parameter))

; Literals
[(hex_integer_literal)
 (decimal_integer_literal)
 (decimal_floating_point_literal)] @number

(symbol_literal) @symbol

[(true)
 (false)] @boolean

(null_literal) @constant.builtin

; Comments
[(documentation_comment)
 (comment)] @comment

; Keywords
["import"
 "library"
 "export"] @include

(this) @variable.builtin

; Reserved words (cannot be used as identifiers)
[(case_builtin)
 "extension"
 "on"
 "class"
 "enum"
 "extends"
 "in"
 "is"
 "new"
 "return"
 "super"
 "with"] @keyword

[(assertion)] @function.builtin

(expression_statement
 (identifier) @keyword
 (#eq? @keyword "rethrow"))

; Built in
["abstract"
 "as"
 "async"
 "await"
 "covariant"
 "deferred"
 "dynamic"
 "external"
 "factory"
 "get"
 "implements"
 "interface"
 "library"
 "operator"
 "mixin"
 "part"
 "set"
 "show"
 "static"
 "typedef"] @keyword

; When used as an identifier
((identifier) @variable.builtin
 (#vim-match? @variable.builtin "^(abstract|as|covariant|deferred|dynamic|export|external|factory|Function|get|implements|import|interface|library|operator|mixin|part|set|static|typedef)$"))

["if"
 "else"
 "switch"
 "default"] @conditional

["try"
 "throw"
 "catch"
 "finally"] @exception

["do"
 "while"
 "continue"
 "for"
 (break_statement)] @repeat

; Error
(ERROR) @error
