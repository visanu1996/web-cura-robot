*** Settings ***
Library    Browser
Library    DateTime
Library    Collections
Library    String
Library    RPA.Excel.Files
Library    RPA.Tables

# Resources.

Resource    ${CURDIR}/resources/POM/home_page.resource
Resource    ${CURDIR}/resources/POM/login_page.resource
Resource    ${CURDIR}/resources/POM/appointment_page.resource
Resource    ${CURDIR}/resources/common.resource

# YML Config
Variables    ${CURDIR}/resources/test_data/web_config.yml