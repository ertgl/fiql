Definitions.

SELECTOR		= ([a-zA-Z0-9]|[_-]|(:))*

VALUE			= "([^"\\]|\\.)*"

LEFT_PARENT		= \(

RIGHT_PARENT	= \)

OP_OR			= \,

OP_AND			= \;

LOOKUP_EQ		= (==)

LOOKUP_NEQ		= (!=)

LOOKUP_LT		= (=lt=)

LOOKUP_LE		= (=le=)

LOOKUP_GT		= (=gt=)

LOOKUP_GE		= (=ge=)

WHITESPACE 		= [\s\t\n\r]


Rules.

{LEFT_PARENT}	: {token, {left_parent, TokenLine, TokenChars}}.

{RIGHT_PARENT}	: {token, {right_parent, TokenLine, TokenChars}}.

{OP_OR}			: {token, {op_or, TokenLine, TokenChars}}.

{OP_AND}		: {token, {op_and, TokenLine, TokenChars}}.

{LOOKUP_EQ}		: {token, {lookup_eq, TokenLine, TokenChars}}.

{LOOKUP_NEQ}	: {token, {lookup_neq, TokenLine, TokenChars}}.

{LOOKUP_LT}		: {token, {lookup_lt, TokenLine, TokenChars}}.

{LOOKUP_LE}		: {token, {lookup_le, TokenLine, TokenChars}}.

{LOOKUP_GT}		: {token, {lookup_gt, TokenLine, TokenChars}}.

{LOOKUP_GE}		: {token, {lookup_ge, TokenLine, TokenChars}}.

{SELECTOR}+		: {token, {selector, TokenLine, TokenChars}}.

{VALUE}+		: {token, {value, TokenLine, TokenChars}}.

{WHITESPACE}+ 	: skip_token.


Erlang code.
