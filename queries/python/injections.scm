; extends
(call
  (attribute
    object: (identifier) @_object (#eq? @_object "spark")
    attribute: (identifier) @_attribute (#eq? @_attribute "sql"))
  (argument_list
    (string
      (string_content) @injection.content))
  (#set! injection.language "sql"))

((expression_statement
  (_ (string (string_content) @injection.content)))
  (comment) @injection.language
  (#match? @injection.language "^# lang: ")
  (#offset! @injection.language 0 8 0 0))
