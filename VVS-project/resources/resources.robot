*** Settings ***
Documentation
...    Author:
...    Maintainer:
...    Test Description:
...    Confluence link:
...    Group in charge:
...    Sample execution: robot -L TRACE -b debug.log -d results general.robot

Library    SeleniumLibrary    run_on_failure=Nothing
Library    DateTime
Library    OperatingSystem
Library    Process
Library    String
Library    Collections
Library    Screenshot

*** Variables ***

*** Keywords ***

Open
     Open Browser    localhost:5555     chrome
     maximize browser window
     wait until page contains    Main Page

404
    click element   //*[contains(text(),'404 test')]
    wait until page contains    File Not Found!
    go back
    page should contain    Main Page

txt
    click element   //*[contains(text(),'Do TXT files work?')]
    wait until page contains    Lorem ipsum
    go back
    page should contain    Main Page

internal links
    click element   //*[contains(text(), 'Do internal links work?')]
    wait until page contains    BACK TO INDEX (MAIN PAGE)
    click element   //*[contains(text(), 'BACK TO INDEX (MAIN PAGE)')]
    page should contain    Main Page

external links
    click element   //*[contains(text(), 'Do external links work?')]
    sleep    5
    wait until page contains   Rick Astley
    go back
    page should contain    Main Page
    sleep    1

close browser
    close browser