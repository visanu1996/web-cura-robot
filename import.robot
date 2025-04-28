*** Settings ***
Library    SeleniumLibrary

# Resrouces. Keywords
Resource    ${CURDIR}/keywords/common.resource
Resource    ${CURDIR}/keywords/appointment.resource

# Resources. Locator 

Resource    ${CURDIR}/resources/home_page.resource
Resource    ${CURDIR}/resources/login_page.resource
Resource    ${CURDIR}/resources/appointment_page.resource
Resource    ${CURDIR}/resources/navigate.resource

# YML Config
Variables    ${CURDIR}/resources/webConfig.yml