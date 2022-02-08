#!/bin/bash -e

bundle exec file_charset_validator --encoding UTF_8 spec/sample/rashomon/UTF_8.txt spec/sample/rashomon/UTF_8.txt spec/sample/rashomon/UTF_8.txt
! bundle exec file_charset_validator --encoding UTF_8 spec/sample/rashomon/UTF_8.txt spec/sample/rashomon/UTF_8.txt spec/sample/rashomon/EUC_JP.txt
! bundle exec file_charset_validator --encoding UTF_8 spec/sample/rashomon/UTF_8.txt spec/sample/rashomon/UTF_8.txt spec/sample/rashomon/Shift_JIS.txt

bundle exec file_charset_validator --encoding Shift_JIS spec/sample/rashomon/Shift_JIS.txt spec/sample/rashomon/Shift_JIS.txt spec/sample/rashomon/Shift_JIS.txt
! bundle exec file_charset_validator --encoding UTF_8 spec/sample/rashomon/Shift_JIS.txt spec/sample/rashomon/Shift_JIS.txt spec/sample/rashomon/EUC_JP.txt
! bundle exec file_charset_validator --encoding UTF_8 spec/sample/rashomon/Shift_JIS.txt spec/sample/rashomon/Shift_JIS.txt spec/sample/rashomon/UTF_8.txt

bundle exec file_charset_validator --encoding EUC_JP spec/sample/rashomon/EUC_JP.txt spec/sample/rashomon/EUC_JP.txt spec/sample/rashomon/EUC_JP.txt
! bundle exec file_charset_validator --encoding EUC_JP spec/sample/rashomon/EUC_JP.txt spec/sample/rashomon/EUC_JP.txt spec/sample/rashomon/Shift_JIS.txt
! bundle exec file_charset_validator --encoding EUC_JP spec/sample/rashomon/EUC_JP.txt spec/sample/rashomon/EUC_JP.txt spec/sample/rashomon/UTF_8.txt
