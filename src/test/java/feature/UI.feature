#Feature: Web UI Test
#
#Background:
#* configure driver = { type: 'chrome', showDriverLog: true }
#
#Scenario: Google Search
#Given driver 'https://google.com'
    #And input("textarea[name=q]", 'facebook')
    #When submit().click("input[name=btnI]")
    #Then waitForUrl('https://facebook.com')