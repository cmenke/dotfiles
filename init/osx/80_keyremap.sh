cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli
[[ -f $cli ]] || return 1

$cli set remap.german_optionbeta2backslash 1
/bin/echo -n .
$cli set remap.german_optionPlus_to_tilde 1
/bin/echo -n .
$cli set remap.german_adapt_option_r_to_pcs_altgr_1 1
/bin/echo -n .
$cli set remap.german_optionLessthan_to_pipe 1
/bin/echo -n .
/bin/echo
