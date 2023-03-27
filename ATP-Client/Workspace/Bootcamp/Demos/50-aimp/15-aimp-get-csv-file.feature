###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 10-aimp
# - Description: Call function AIMP
#
# - Created date: 24/02/2023
# - Updated date: 24/02/2023
###########################################################################

Feature: 15-aimp-get-csv-file

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

    Scenario Outline: Execute AIMP - step 2

        #Data table: row selection with column header name
        When the user selects row that has the text <Parameter> in column with header: "Parameter title"

        #Data table: select a value in the selected drop down list of the selected row
        And the user selects cell with header: "First value" of selected row
        And the user adds the text <Value> in selected cell

        Examples:
            | Parameter       | Value             |
            | "Script"        | "YGET_CSV_FILE"   |
            | "Input param 1" | "tmp"             |
            | "Input param 2" | "30-X3-SOEntry" |
            | "Input param 3" | "csv"             |
            


    Scenario: Execute AIMP - step 3

        #And the user waits 10 seconds
        #Page action: click button in the popup header
        Then the user clicks the "Print" button in the header


        #Read the log and get outside parameters

        #Log panel: check a log is displayed
        Given a log panel appears
        #Log panel: selection of the main log panel
        When the user selects the main log panel of the page

        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "CSV_SOSITE_1"
        Then the user extracts the value from the selected log panel line starting at 32 for 200 characters and stores it in key "CSV_SOSITE_1"
    
    
        #Close the log
        And the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0302A2 - Logout scenario
        And the user logs-out from the system