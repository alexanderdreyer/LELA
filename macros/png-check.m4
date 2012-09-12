# Check for PNG

dnl LB_CHECK_PNG
dnl
dnl Test for the libpng and define PNG_CFLAGS, PNG_LIBS, and HAVE_LIBPNG

AC_DEFUN([LB_CHECK_PNG],
[
# This is because the first PKG_CHECK_MODULES call is inside a conditional.
PKG_PROG_PKG_CONFIG

AC_ARG_WITH([png],
  [AS_HELP_STRING([--with-png],
    [support handling png files @<:@default=check@:>@])],
  [],
  [with_png=check])
AS_CASE(["$with_png"],
  [yes], [PKG_CHECK_MODULES([PNG], [libpng], [HAVE_LIBPNG=1])],
  [no], [],
  [PKG_CHECK_MODULES([PNG], [libpng], [HAVE_LIBPNG=1], [HAVE_LIBPNG=0])])
AM_CONDITIONAL([USE_LIBPNG], [test "$with_png" != no -a "$HAVE_LIBPNG" -eq 1])
])
