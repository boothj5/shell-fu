#!/bin/sh
clear && cat target/test-reports/TESTS-TestSuites.xml | grep errors=\"[1-9]\" | grep \ name=


