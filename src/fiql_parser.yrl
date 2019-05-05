Nonterminals
	expression
.


Terminals
	left_parent
	right_parent
	selector
	value
	op_or
	op_and
	lookup_eq
	lookup_neq
	lookup_lt
	lookup_le
	lookup_gt
	lookup_ge
.


Rootsymbol
	expression
.

expression ->
	left_parent expression right_parent : '$2'
.

expression ->
	expression op_or expression : {'$2', '$1', '$3'}
.

expression ->
	expression op_and expression : {'$2', '$1', '$3'}
.

expression ->
	selector lookup_eq value : {'$2', '$1', '$3'}
.

expression ->
	selector lookup_neq value : {'$2', '$1', '$3'}
.

expression ->
	selector lookup_lt value : {'$2', '$1', '$3'}
.

expression ->
	selector lookup_le value : {'$2', '$1', '$3'}
.

expression ->
	selector lookup_gt value : {'$2', '$1', '$3'}
.

expression ->
	selector lookup_ge value : {'$2', '$1', '$3'}
.


Erlang code.
