(identifier) @variable

((identifier) @constant
 (#match? @constant "^[A-Z][A-Z\\d_]*$"))

[
  "break"
  "case"
  "const"
  "continue"
  "default"
  "do"
  "else"
  "enum"
  "extern"
  "for"
  "if"
  "inline"
  "return"
  "sizeof"
  "static"
  "struct"
  "switch"
  "typedef"
  "union"
  "volatile"
  "while"
  "#define"
  "#elif"
  "#else"
  "#endif"
  "#if"
  "#ifdef"
  "#ifndef"
  "#include"
] @keyword

[
  "--"
  "-"
  "-="
  "->"
  "="
  "!="
  "*"
  "&"
  "&&"
  "+"
  "++"
  "+="
  "<"
  "=="
  ">"
  "||"
] @operator

"." @punctuation.delimiter
";" @punctuation.delimiter

(string_literal) @string
(system_lib_string) @string
(null) @constant.builtin
(number_literal) @number
(char_literal) @string
(field_identifier) @property
(statement_identifier) @label
(type_identifier) @type
(primitive_type) @type.builtin
(sized_type_specifier) @type.builtin

(call_expression
  function: (identifier) @function)

(call_expression
  function: (field_expression
    field: (field_identifier) @function))

(function_declarator
  declarator: (identifier) @function)

(preproc_function_def
  name: (identifier) @function.special)

(comment) @comment

; ZenC-specific overlays implemented as regex matches on C identifiers/comments.
((identifier) @keyword
 (#match? @keyword "^(if|else|while|for|return|break|continue|do|goto|switch|case|default|match|try|catch|guard|unless|async|await|launch|defer|asm|unsafe|inline|noreturn|import|module|struct|enum|union|fn|trait|impl|var|const|let|mut|def|alias|opaque|type|typedef|extern|static|volatile|autofree|comptime|embed|ref|sizeof|typeof|undefined|new|delete)$"))

((identifier) @constant.builtin
 (#match? @constant.builtin "^(true|false|null)$"))

((identifier) @type.builtin
 (#match? @type.builtin "^(int|uint|char|bool|void|u8|u16|u32|u64|u128|U8|U16|U32|U64|U128|i8|i16|i32|i64|i128|I8|I16|I32|I64|I128|f32|f64|F32|F64|usize|isize|string|c_int|c_uint|c_char|c_uchar|c_short|c_ushort|c_long|c_ulong|c_longlong|c_ulonglong|byte|rune|u0|U0|va_list)$"))

((identifier) @function
 (#match? @function "^[a-zA-Z_][a-zA-Z0-9_]*$")
 (#is-not? local))

((comment) @keyword.directive
 (#match? @keyword.directive "^//>\\s*[a-zA-Z0-9_]+:"))

((comment) @attribute
 (#match? @attribute "@[a-zA-Z_][a-zA-Z0-9_]*"))
