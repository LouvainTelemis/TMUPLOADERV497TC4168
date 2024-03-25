*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn



*** Variables ***

# ${MyHostname}    desktopj93k2ev
${MyHostname}    demo6733
${MyRepositoryName}    TMUPLOADERV497TC4168
# You must create the folder "MyFolderWorkspace" manually in the computer of Jenkins master, in case you test the script with the computer of Jenkins master
${MyFolderWorkspace}    C:/000/jenkins/workspace

${MyDirectoryDownload}    C:\\temp\\zDownload
${base_url_smtp_server}    http://localhost:8070

${MyDicomPath}    C:/VER497TMP1/telemis/dicom
${DirTmUploaderData}    D:/telemis/externalBundles
${DirTmUploaderMetadata}    D:/telemis/dicom/bundles

${MyText01}    àâäèéêëîïôùûüÿç ÄäÖöÜüß @+-_

${MyPatient1FamilyName}    AZ127431
${MyPatient1FirstName}    ALBERT
${MyPatient1SeriesDescription}    CTOP127431
${MyPatient1BirthdateYYYY}    1945
${MyPatient1BirthdateMM}    11
${MyPatient1BirthdateDD}    27
${MyPatient1AccessionNumber}    CTEF127431

${MyPatient2FamilyName}    AZ138542
${MyPatient2FirstName}    ALBERT
${MyPatient2SeriesDescription}    CTOP138542
${MyPatient2BirthdateYYYY}    1956
${MyPatient2BirthdateMM}    12
${MyPatient2BirthdateDD}    28
${MyPatient2AccessionNumber}    CTEF138542

${MyPatient3FamilyName}    AZ250764
${MyPatient3FirstName}    BERNARD
${MyPatient3SeriesDescription}    CTOP250764
${MyPatient3BirthdateYYYY}    1958
${MyPatient3BirthdateMM}    11
${MyPatient3BirthdateDD}    30
${MyPatient3AccessionNumber}    CTEF250764

${MyPatient4FamilyName}    AZ149653
${MyPatient4FirstName}    ALBERT
${MyPatient4SeriesDescription}    CTOP149653
${MyPatient4BirthdateYYYY}    1967
${MyPatient4BirthdateMM}    10
${MyPatient4BirthdateDD}    29
${MyPatient4AccessionNumber}    CTEF149653

${MyPatient5FamilyName}    AZ361875
${MyPatient5FirstName}    DIDIER
${MyPatient5SeriesDescription}    CTOP361875
${MyPatient5BirthdateYYYY}    1969
${MyPatient5BirthdateMM}    12
${MyPatient5BirthdateDD}    13
${MyPatient5AccessionNumber}    CTEF361875

${MyPatient6FamilyName}    AZ472986
${MyPatient6FirstName}    EDOUARD
${MyPatient6SeriesDescription}    CTOP472986
${MyPatient6BirthdateYYYY}    1942
${MyPatient6BirthdateMM}    10
${MyPatient6BirthdateDD}    14
${MyPatient6AccessionNumber}    CTEF472986
${MyPatient6PatientID}    CTAB472986
${MyPatient6StudyDescription}    CTMN472986
${MyPatient6StudyDate}    18/03/2024

${MyPatient7FamilyName}    AZ583197
${MyPatient7FirstName}    FABRICE
${MyPatient7SeriesDescription}    CTOP583197
${MyPatient7BirthdateYYYY}    1953
${MyPatient7BirthdateMM}    12
${MyPatient7BirthdateDD}    15
${MyPatient7AccessionNumber}    CTEF583197
${MyPatient7PatientID}    CTAB583197
${MyPatient7StudyDescription}    CTMN583197
${MyPatient7StudyDate}    19/03/2024

${MyPatient8FamilyName}    AZ694218
${MyPatient8FirstName}    HECTOR
${MyPatient8SeriesDescription}    CTOP694218
${MyPatient8BirthdateYYYY}    1964
${MyPatient8BirthdateMM}    10
${MyPatient8BirthdateDD}    16
${MyPatient8AccessionNumber}    CTEF694218
${MyPatient8PatientID}    CTAB694218
${MyPatient8StudyDescription}    CTMN694218
${MyPatient8StudyDate}    19/03/2024

${MyPortNumber}    10000
#  Do not use the brackets to define the variable of bearer token
${bearerToken}    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJJbnN0YWxsZXIiLCJuYW1lIjoiSW5zdGFsbGVyIiwiaXNzIjoiVGVsZW1pcyIsImlhdCI6MTUxNjIzOTAyMiwiZXhwIjoxODYxOTIwMDAwfQ.pynnZ69Qx50wuz0Gh4lx-FHZznrcQkbMm0o-PLhb3S0

${MyBrowser1}    chrome
${MyBrowser2}    firefox
${MyBrowser3}    edge

${TmpWebAdministratorLogin}    telemis_webadmin
${TmpWebAdministratorPassword}    KEYCLOAKTastouk!

${TmpWebUser1Login}    anthony
${TmpWebUser1Password}    Videogames2024
${TmpWebUser1Email}    anthony@hospital8.com

${TmpWebUser2Login}    albert
${TmpWebUser2Password}    Videogames2024
${TmpWebUser2Email}    albert@hospital8.com

${TmpWebUser3Login}    mary
${TmpWebUser3Password}    Videogames2024
${TmpWebUser3Email}    mary@hospital8.com

${TmpWebUser4Login}    thomas
${TmpWebUser4Password}    Videogames2024
${TmpWebUser4Email}    thomas@hospital8.com

${TmUploaderUser1Login}    gabriel
${TmUploaderUser1Password}    Videogames2024

# NOT USEFUL ${MyFolderResults}    results
${MyLogFile}    MyLogFile.log
${MyFolderCertificate}    security

${MyEntityName1}    audit
${MyEntityPort1}    9940
${MyEntityName2}    dicomgate
${MyEntityPort2}    9920
${MyEntityName3}    hl7gate
${MyEntityPort3}    9930
${MyEntityName4}    patient
${MyEntityPort4}    9990
${MyEntityName5}    registry
${MyEntityPort5}    9960
${MyEntityName6}    repository
${MyEntityPort6}    9970
${MyEntityName7}    user
${MyEntityPort7}    9950
${MyEntityName8}    worklist
${MyEntityPort8}    9980

${VersionSiteManager}    4.1.2-228



*** Keywords ***

Remove My Previous Results
    [Documentation]    Delete the previous results and log files
    # Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/geckodriver*
    # Delete the previous screenshots
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/*.png
    # Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}
    # ${Time} =    Get Current Date
    # Create file  ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Start the tests \n
    # Remove DICOM files from dicomPath of TMAA
    Remove Files    ${MyDicomPath}/*.*
    Create Directory    ${DirTmUploaderData}
    Create Directory    ${DirTmUploaderMetadata}
    Remove Files    ${DirTmUploaderData}/*
    Remove Files    ${DirTmUploaderMetadata}/*


Check That Watchdog Is Running
    [Documentation]    Check that Watchdog is running
    create session    mysession    https://${MyHostname}:${MyPortNumber}/watchdog/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    3s


Check Version Of Watchdog
    [Documentation]    Check the version number of Watchdog
    create session    mysession    https://${MyHostname}:${MyPortNumber}/watchdog/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /version    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    ${Time} =    Get Current Date
    Append To File    ${MyLogFile}    ${Time}${SPACE}Version number of Watchdog ${response.text} \n

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    3s
    # Should Contain    ${response.text}    ${VersionSiteManager}


Check That Site Manager Is Running
    [Documentation]    Check that Site Manager is running
    create session    mysession    https://${MyHostname}:${MyPortNumber}/site/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    3s


Check Version Of Site Manager
    [Documentation]    Check the version number of Site Manager
    create session    mysession    https://${MyHostname}:${MyPortNumber}/site/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /version    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    ${Time} =    Get Current Date
    Append To File    ${MyLogFile}    ${Time}${SPACE}Version number of Site Manager ${response.text} \n

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    2s

    ${response} =    GET On Session    mysession    /identity    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    sitemanager
    Sleep    3s


Check That Telemis Entity Is Running
    [Documentation]    Check that Telemis Entity is running
    [Arguments]    ${MyEntityPort}
    create session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    3s


Check Version Of Telemis Entity
    [Documentation]    Check the version number of entity
    [Arguments]    ${MyEntityName}    ${MyEntityPort}
    create session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /version    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    ${Time} =    Get Current Date
    Append To File    ${MyLogFile}    ${Time}${SPACE}Version number of Telemis-${MyEntityName}${SPACE}${response.text} \n

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    2s

    ${response} =    GET On Session    mysession    /identity    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityName}
    Sleep    3s


Take My Screenshot
    ${MyCurrentDateTime} =    Get Current Date    result_format=%Y%m%d%H%M%S
    Log    ${MyCurrentDateTime}
    # Keyword of SeleniumLibrary, you do not need to use the library Screenshot
    Capture Page Screenshot    selenium-screenshot-${MyCurrentDateTime}.png
    Sleep    2s


Open My Site Manager
    Open Browser    https://${MyHostname}:10000/site    Chrome    options=add_argument("--disable-infobars");add_argument("--lang\=en");binary_location=r"C:\\000\\chromeWin64ForTests\\chrome.exe"
    Wait Until Element Is Visible    id=kc-login    timeout=15s
    Maximize Browser Window
    Sleep    2s
    Input Text    id=username    local_admin    clear=True
    Input Text    id=password    KEYCLOAKTastouk!    clear=True
    Sleep    2s
    Click Button    id=kc-login
    # Locator of Selenium IDE
    Wait Until Element Is Visible    xpath=//strong[contains(.,'Site Manager')]    timeout=15s
    Element Should Be Visible    xpath=//strong[contains(.,'Site Manager')]
    Sleep    2s


Log Out My User Session Of Site Manager
    Click Link    link:Sign out
    Wait Until Element Is Visible    id=kc-login    timeout=15s
    Element Should Be Visible    id=kc-login
    Sleep    2s


My User Opens Internet Browser And Connects To My TMP Web
    [Documentation]    The user opens Internet browser and then connects to the website of TMP Web
    [Arguments]    ${MyUserLogin}    ${MyUserPassword}
    Open Browser    https://${MyHostname}.telemiscloud.com/tmpweb/patients.app    Chrome    options=add_argument("--disable-infobars");add_argument("--lang\=en");binary_location=r"C:\\000\\chromeWin64ForTests\\chrome.exe"
    Wait Until Page Contains    TM-Publisher web    timeout=15s
    Maximize Browser Window
    Wait Until Element Is Visible    id=username    timeout=15s
    Wait Until Element Is Visible    id=password    timeout=15s
    Input Text    id=username    ${MyUserLogin}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=username    ${MyUserLogin}
    Input Text    id=password    ${MyUserPassword}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=password    ${MyUserPassword}
    Click Button    id=kc-login
    Wait Until Page Contains    Telemis Media Publisher Web    timeout=15s
    Sleep    3s


Log Out My User Session Of TMP Web
    Click Link    link=Logout
    Wait Until Element Is Visible    xpath=//*[@id="doctor-button"]    timeout=15s
    Sleep    2s


Delete All My Email Messages In SMTP Server
    [Documentation]    Delete all the email messages in SMTP server
    Create Session    AppAccess    ${base_url_smtp_server}
    ${response} =    Delete On Session    AppAccess    /api/emails
    log    ${response.status_code}
    log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    2s


Log Out My User Session Of TM-Uploader
    Wait Until Element Is Visible    id=logoutLabelLayout    timeout=15s
    Click Element    id=logoutLabelLayout
    Wait Until Page Contains    Are you sure you want to logout ?    timeout=15s
    Wait Until Element Is Visible    id=rightButton    timeout=15s
    Click Element    id=rightButton
    Wait Until Element Is Visible    id=kc-login    timeout=15s
    Sleep    1s



*** Test Cases ***

Test01
    [Documentation]    Reset the test results
    [Tags]    CRITICALITY LOW
    Remove My Previous Results


Test02
    [Documentation]    Check that the application has been started
    [Tags]    CRITICALITY LOW
    ${response} =    GET    https://${MyHostname}:10210/webuploader    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s


Test03
    [Documentation]    Access the login page of TM-Uploader
    [Tags]    CRITICALITY NORMAL
    Open Browser    https://${MyHostname}:10210/webuploader    Chrome    options=add_argument("--disable-infobars");add_argument("--lang\=en");add_argument("--enable-chrome-browser-cloud-management");binary_location=r"C:\\000\\chromeWin64ForTests\\chrome.exe"
    Maximize Browser Window
    Wait Until Element Is Visible    id=kc-locale-dropdown    timeout=15s


Test04
    [Documentation]    Select the language in the drop-donw menu
    [Tags]    CRITICALITY LOW
    # Select the language English
    # The keyword Select From List By Index/Label/Value does not work with the combo box of this web page
    Element Should Be Visible    id=kc-locale-dropdown
    Click Element    id=kc-locale-dropdown
    Wait Until Element Is Visible    link=English    timeout=9s
    Element Should Be Visible    link=English
    Click Element    link=English
    Mouse Over    id=kc-login
    Wait Until Page Contains    Login to your account    timeout=15s


Test05
    [Documentation]    Enter the login and password to log into the user's account
    [Tags]    CRITICALITY NORMAL
    Wait Until Element Is Visible    id=username    timeout=15s
    Wait Until Element Is Visible    id=password    timeout=15s
    Input Text    id=username    ${TmUploaderUser1Login}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=username    ${TmUploaderUser1Login}
    Input Text    id=password    ${TmUploaderUser1Password}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=password    ${TmUploaderUser1Password}
    Click Button    id=kc-login
    Wait Until Page Contains    At least the patient name field and one recipient must be filled    timeout=15s


Test06
    [Documentation]    Check that the instructions of end users are visible on the page
    [Tags]    CRITICALITY NORMAL
    Page Should Contain    At least the patient name field and one recipient must be filled


Test07
    [Documentation]    Check that the fields exist in the main section of the page: [Patient Family Name], [Patient Given Name], [Patient ID], [Birth Date], [Study Type], [Study Date], [Accession Number]
    [Tags]    CRITICALITY NORMAL
    Wait Until Element Is Visible    id=patientFamilyNameField    timeout=15s
    Wait Until Element Is Visible    id=patientGivenNameField    timeout=15s
    Wait Until Element Is Visible    id=patientIdField    timeout=15s
    Wait Until Element Is Visible    id=patientBirthdateField    timeout=15s

    Wait Until Element Is Visible    id=studyTypeField    timeout=15s
    Wait Until Element Is Visible    id=studyDateField    timeout=15s
    Wait Until Element Is Visible    id=accesionNumberField    timeout=15s


Test08
    [Documentation]    Check that the text area [Comment] are list of users' groups [Recipients] both exist on the page
    [Tags]    CRITICALITY NORMAL
    Wait Until Element Is Visible    id=commentField    timeout=15s
    Wait Until Element Is Visible    id=recipientsListField    timeout=15s


Test09
    [Documentation]    Check that the buttons exist at the bottom the page: [Worklist], [Reset], [Upload], [Select files], [CD-ROM], [Select all], [Drag & Drop here]
    [Tags]    CRITICALITY NORMAL
    Wait Until Element Is Visible    id=worklistButton    timeout=15s
    Wait Until Element Is Visible    id=resetButton    timeout=15s
    Wait Until Element Is Visible    id=uploadButton    timeout=15s

    Wait Until Element Is Visible    id=selectFilesButton    timeout=15s
    Wait Until Element Is Visible    id=selectDirButton    timeout=15s

    Wait Until Element Is Visible    id=selectAllButton    timeout=15s
    Wait Until Element Is Visible    id=dropZone    timeout=15s


Test10
    [Documentation]    Click the button "Select files" to import non-DICOM files
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    id=selectFilesButton    timeout=15s
    # I do not find any method to find and select the window "Open" with the keywords "Get Window Identifiers", "Get Window Handles", "Get Window Titles", "Get Title" and "Switch Window"
    # I installed and tested the keywords of robotframework-autoitlibrary without any success, probably it is not compatible with version 64-bit of Python
    Click Element    id=selectFilesButton
    # Run    C:\\000\\jenkins\\script\\UploadData3.au3
    Run    C:\\000\\jenkins\\script\\UploadData3.exe
    Run Keyword And Ignore Error    Wait Until Created    C:\\temp\\zUpload\\TestOK.txt    50s
    ${fileExists} =    Run Keyword And Return Status    File Should Exist    C:\\temp\\zUpload\\TestFailed.txt
    Log    ${fileExists}
    # Run Keyword If    '${fileExists}' == 'True'    Run    C:\\000\\jenkins\\script\\UploadData3.au3
    Run Keyword If    '${fileExists}' == 'True'    Run    C:\\000\\jenkins\\script\\UploadData3.exe
    Wait Until Created    C:\\temp\\zUpload\\TestOK.txt    50s
    Sleep    1s
    Remove Files    C:\\temp\\zUpload\\*.*
    # REMARK: the keyword "Wait Until Page Contains" is case-sensitive
    Wait Until Page Contains    image01.jpg    timeout=15s
    # Wait Until Element Is Visible    id=mfs-img-0    timeout=15s
    Press Keys    id=ROOT-2521314    PAGE_DOWN
    Take My Screenshot


Test11
    [Documentation]    Fill in the family name and the first name of the patient
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    id=patientFamilyNameField    timeout=15s
    Input Text    id=gwt-uid-3    ${MyPatient8FamilyName}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=gwt-uid-3    ${MyPatient8FamilyName}

    Wait Until Element Is Visible    id=patientGivenNameField    timeout=15s
    Input Text    id=gwt-uid-5    ${MyPatient8FirstName}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=gwt-uid-5    ${MyPatient8FirstName}

    Wait Until Element Is Visible    id=commentField    timeout=15s
    Click Element    id=commentField
    Take My Screenshot


Test12
    [Documentation]    Click the button "Worklist" (associate the study with a worklist)
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    id=worklistButton    timeout=15s
    Click Element    id=worklistButton


Test13
    [Documentation]    Check the result in the worklist table (4 columns = Property + Original + New + Overwrite; 4 rows = Patient Name + Patient Id + Birth Date + Accession Number)
    [Tags]    CRITICALITY HIGH
    Wait Until Page Contains    A matching entry in the worklist has been found    timeout=15s
    Wait Until Page Contains    Original    timeout=15s
    Wait Until Page Contains    Overwrite    timeout=15s
    Wait Until Page Contains    Patient Id    timeout=15s
    Wait Until Page Contains    ${MyPatient8PatientID}    timeout=15s
    # Format of the field "Birth Date": dd/mm/yyyy
    Wait Until Page Contains    Birth Date    timeout=15s
    Wait Until Page Contains    ${MyPatient8BirthdateDD}/${MyPatient8BirthdateMM}/${MyPatient8BirthdateYYYY}    timeout=15s
    Wait Until Page Contains    Study Date    timeout=15s
    Wait Until Page Contains    ${MyPatient8StudyDate}    timeout=15s
    Wait Until Page Contains    Accession Number    timeout=15s
    Wait Until Page Contains    ${MyPatient8AccessionNumber}    timeout=15s
    # Locator of the checkbox "Accession Number"
    Wait Until Element Is Visible    id=accessionNumberCheckbox    timeout=15s
    Wait Until Element Is Visible    id=studydateCheckbox    timeout=15s
    Wait Until Element Is Visible    id=cancelButton    timeout=15s
    Wait Until Element Is Visible    id=confirmButton    timeout=15s


Test14
    [Documentation]    Select the Accession Number and the Study Date, then click the button "Confirm"
    [Tags]    CRITICALITY HIGH
    Element Should Be Visible    id=studydateCheckbox
    Click Element    id=studydateCheckbox
    # Select the accession number
    Element Should Be Visible    id=accessionNumberCheckbox
    Click Element    id=accessionNumberCheckbox
    # The keyword (Element Should Be Enabled) can not check if this checkbox (id=accessionNumberCheckbox) is selected. I do not find any method to check if this checkbox is selected. The temporary solution is to check that the value of the field "Accession Number" is correct in the next page.
    Take My Screenshot
    Click Element    id=confirmButton
    Wait Until Page Contains    Accession Number    timeout=15s
    Wait Until Page Contains    ${MyPatient8AccessionNumber}    timeout=15s


Test15
    [Documentation]    Check that the fields of the form have been filled properly in the "blue" section of the patient information
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    id=patientFamilyNameField    timeout=15s
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=gwt-uid-3    ${MyPatient8FamilyName}
    Wait Until Element Is Visible    id=patientGivenNameField    timeout=15s
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=gwt-uid-5    ${MyPatient8FirstName}
    Wait Until Element Is Visible    id=patientIdField    timeout=15s
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    css=#patientIdField > .v-filterselect-input    ${MyPatient8PatientID}
    Wait Until Element Is Visible    id=patientBirthdateField    timeout=15s
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    css=#patientBirthdateField > .v-filterselect-input    ${MyPatient8BirthdateDD}/${MyPatient8BirthdateMM}/${MyPatient8BirthdateYYYY}

    Wait Until Element Is Visible    id=studyDateField    timeout=10s
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    css=#studyDateField > .v-filterselect-input    ${MyPatient8StudyDate}
    Wait Until Element Is Visible    id=accesionNumberField    timeout=10s
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    css=#accesionNumberField > .v-filterselect-input    ${MyPatient8AccessionNumber}


Test16
    [Documentation]    Write a comment in the text area (write the description of the study)
    [Tags]    CRITICALITY NORMAL
    Wait Until Element Is Visible    id=commentField    timeout=15s
    Set Focus To Element    id=commentField
    Input Text    id=commentField    ${MyText01}    clear=True
    # I can not check if the field "Comment" contains the text. The test failed with the keywords (Get Text, Get Value, Wait Until Page Contains, Textfield Value Should Be). As a temporary solution I check the contents of the generated XML file (bundle).
    Sleep    1s


Test17
    [Documentation]    Select the user groups from the list (assign the study to the user groups)
    [Tags]    CRITICALITY NORMAL
    # The keyword (Get Selected List Value) does not work to select the user groups in this list
    Wait Until Element Is Visible    id=recipientsListField    timeout=15s
    Click Element    id=recipientsListField
    Sleep    1s
    # Later you can test and check if the items have been selected correctly with the keyword (Get Element Attribute xpath=//div[@id='recipientsListField']/select)
    Take My Screenshot


Test18
    [Documentation]    Click the button "Upload" to import the data to PACS server
    [Tags]    CRITICALITY HIGH
    Wait Until Element Is Visible    id=uploadButton    timeout=15s
    Click Element    id=uploadButton


Test19
    [Documentation]    Confirm your selection
    [Tags]    CRITICALITY NORMAL
    Wait Until Page Contains    Confirmation    timeout=15s
    Wait Until Page Contains    Are you sure you want to upload the selected files and entered data    timeout=15s
    Wait Until Element Is Visible    id=rightButton    timeout=15s
    Take My Screenshot
    Click Element    id=rightButton


Test20
    [Documentation]    User receives a message confirming that the data transfer has been completed successfully
    [Tags]    CRITICALITY NORMAL
    Wait Until Page Contains    Upload completed successfully    timeout=15s


Test21
    [Documentation]    User chooses between two options: continue or exit the program
    [Tags]    CRITICALITY NORMAL
    Wait Until Page Contains    You may return to form and upload another data or exit application    timeout=15s
    Wait Until Page Contains    Return    timeout=15s
    Wait Until Page Contains    Logout    timeout=15s
    Wait Until Element Is Visible    id=rightButton    timeout=15s
    Take My Screenshot
    Click Element    id=rightButton
    Wait Until Page Contains    At least the patient name field and one recipient must be filled    timeout=15s
    Take My Screenshot


Test22
    [Documentation]    Log out the user's session
    [Tags]    CRITICALITY LOW
    Log Out My User Session Of TM-Uploader


Test23
    [Documentation]    Shut down the browser and reset the cache
    [Tags]    CRITICALITY LOW
    Close All Browsers
    ${NbrOfFilesInDirData} =    Count Files In Directory    ${DirTmUploaderData}
    Run Keyword If    ${NbrOfFilesInDirData} > 0    Log    Image file has been imported successfully to dir externalBundles
    ${NbrOfFilesInDirMetadata} =    Count Files In Directory    ${DirTmUploaderMetadata}
    Run Keyword If    ${NbrOfFilesInDirMetadata} > 0    Log    XML file has been imported successfully to dir bundles
    Create Directory    C:/temp/
    Remove File    C:/temp/zMetadata.xml
    ${fileExists} =    Run Keyword And Return Status    File Should Exist    ${DirTmUploaderMetadata}/*.xml
    IF    '${fileExists}' == 'True'
      Copy File    ${DirTmUploaderMetadata}/*.xml    C:/temp/zMetadata.xml
      ${MyXmlFile} =    Get File    C:/temp/zMetadata.xml
      Run Keyword If    '${MyText01}' in '''${MyXmlFile}'''    Log    The comments have been saved in XML file
    ELSE
      Log    XML file does not exist
    END
