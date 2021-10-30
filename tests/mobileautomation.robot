*** Settings ***
  Documentation   Aulas de automação mobile com appium e android studio

  Library   AppiumLibrary

  Test Setup
  Test Teardown

*** Keywords ***

Abrir aplicativo
  Open Application    http://localhost:4723/wd/hub
  ...                 automationName=uiautomator2
  ...                 deviceName=0027255694
  ...                 platformNme=Android
  ...                 autoGrantPermissions=true
  ...                 appPackage=

Fechar aplicativo
  Close Application