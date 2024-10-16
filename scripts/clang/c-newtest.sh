#!/bin/bash

read -p "Enter unit test name: " testname

targetfile="$testname.c"

touch $targetfile

echo -e "RUN_TEST_GROUP($testname); //cut-paste this at tests.c
#include \"tester.h\"

// static ;
// static char *expect() {
// }
// static char *given() {
// }
static void match(char *expected, char *given, int line) {
	TEST_ASSERT_EQUAL_STRING_MESSAGE(expected, given, ft_itoa(line));
	return;
}

TEST_GROUP($testname);

TEST_SETUP($testname) {
}

TEST_TEAR_DOWN($testname) {
}

TEST($testname, check_equal) {
	match(\"\", \" \", __LINE__);
}

TEST_GROUP_RUNNER($testname) {
	RUN_TEST_CASE($testname, check_equal);
}
" >> $targetfile
