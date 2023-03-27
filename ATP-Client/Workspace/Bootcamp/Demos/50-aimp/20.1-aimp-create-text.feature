###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 20.1-aimp-create-text
# - Description: Call function AIMP - Create textes
#
# - Created date: 24/02/2023
# - Updated date: 24/02/2023
###########################################################################

Feature: 20.1-aimp-create-text

    Scenario: 0302A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: Execute AIMP - step 1

        #Open function by code
        Given the user opens the "AIMP" function

        #Check the function is opened
        Then the "Enter report parameters" screen is displayed

        #Text field: selection by name then verifying the value entered
        Given the user selects the text field with name: "Report code"
        When the user writes "YATP" to the selected text field
        Then the value of the selected text field is "YATP"

        #Key command: use the tab action
        And the user hits tab


        #Data table: select the main data table of the page
        Given the user selects the main data table of the page

    Scenario Outline: Execute AIMP - step 2.1

        #Data table: row selection with column header name
        When the user selects row that has the text <Parameter> in column with header: "Parameter title"

        #Data table: select a value in the selected drop down list of the selected row
        And the user selects cell with header: "First value" of selected row
        And the user adds the text <Value> in selected cell

        Examples:
            | Parameter       | Value            |
            | "Script"        | "YCREATE_TEXT"   |
            | "Input param 1" | "Sales Field"    |
            | "Input param 2" | "Sls Fld"        |
            | "Input param 3" | "Site Field"     |
            | "Input param 4" | "Site Fld"       |
            | "Input param 5" | ""               |


    Scenario: Execute AIMP - step 3.1

        #And the user waits 10 seconds
        #Page action: click button in the popup header
        Then the user clicks the "Print" button in the header


Scenario Outline: Execute AIMP - step 2.2

        #Data table: row selection with column header name
        When the user selects row that has the text <Parameter> in column with header: "Parameter title"

        #Data table: select a value in the selected drop down list of the selected row
        And the user selects cell with header: "First value" of selected row
        And the user adds the text <Value> in selected cell

        Examples:
            | Parameter       | Value            |
            | "Script"        | "YCREATE_TEXT"   |
            | "Input param 1" | "Customer Field" |
            | "Input param 2" | "Cust Fld"       |
            | "Input param 3" | "Supplier Field" |
            | "Input param 4" | "Sup Fld"        |
            | "Input param 5" | ""               |


    Scenario: Execute AIMP - step 3.2

        #And the user waits 10 seconds
        #Page action: click button in the popup header
        Then the user clicks the "Print" button in the header

    #Read the log and get outside parameters

    #Log panel: check a log is displayed
    #Given a log panel appears
    #And the user waits 5 seconds
    #Log panel: selection of the main log panel
    #When the user selects the main log panel of the page

    #This step definition will allways select the 1st occurent of the text searched
    #When the user selects the log panel line containing text "OUT_01="
    #Then the user extracts the value from the selected log panel line starting at 8 for 200 characters and stores it in key "ENV_OUT_01"
    #And the user waits 10 seconds

    #This step definition will allways select the 1st occurent of the text searched
    #When the user selects the log panel line containing text "OUT_02="
    #Then the user extracts the value from the selected log panel line starting at 8 for 200 characters and stores it in key "ENV_OUT_02"
    #And the user waits 10 seconds

    #Close the log
    #And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel


    Scenario: 0302A2 - Logout scenario
        And the user logs-out from the system