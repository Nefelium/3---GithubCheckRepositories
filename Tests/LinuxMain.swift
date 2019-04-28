import XCTest

import ConsoleGithubTests

var tests = [XCTestCaseEntry]()
tests += ConsoleGithubTests.allTests()
XCTMain(tests)