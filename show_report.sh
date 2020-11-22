#!/bin/sh

set -e
PACKAGE_NAME=hackerrank_practice
pycodestyle --max-doc-length 160 --ignore E203,E501,W503 \
	    ${PACKAGE_NAME} tests
pylint --rcfile=.pylintrc ${PACKAGE_NAME}
mypy ${PACKAGE_NAME} tests
pytest --cov ${PACKAGE_NAME} --cov-report term-missing --cov-fail-under=100 \
       --junit-xml test-results/${PACKAGE_NAME}.xml \
       --doctest-modules ${PACKAGE_NAME} tests/
cloc ${PACKAGE_NAME}
