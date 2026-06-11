if exists("b:current_syntax")
  finish
endif

syntax match awsConfigComment /^[#;].*/
syntax match awsConfigHeader  /^\[.\{-}\]/
syntax match awsConfigKey     /^\s*[A-Za-z_][A-Za-z0-9_]*\ze\s*=/

syntax match awsConfigFlag    /--[A-Za-z0-9-]\+/
syntax match awsConfigArn     /arn:aws:\S\+/ contains=awsConfigAccount,awsConfigRole
syntax match awsConfigAccount /\d\{12}/ contained
syntax match awsConfigRole    /role\/\zs\S\+/ contained
syntax match awsConfigEmail   /[A-Za-z0-9._%+-]\+@[A-Za-z0-9.-]\+\.[A-Za-z]\+/
syntax match awsConfigRegion  /\<\(us\|eu\|ap\|sa\|ca\|me\|af\|il\)-[a-z]\+-\d\>/
syntax keyword awsConfigCommand gsts

hi def link awsConfigComment Comment

let b:current_syntax = "awsconfig"
