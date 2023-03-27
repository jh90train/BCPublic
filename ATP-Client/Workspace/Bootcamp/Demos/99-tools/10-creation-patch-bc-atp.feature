###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code : 10-creation-patch-bc-atp
# - Description : Creation patch for materials of theis Bootcamp
# - Legislation : 
# - JIRA ID : '-XXXX'
# - Created by : 
# - Created date - 2023-03-23
# - Updated by :
# - Updated date :
###########################################################################

Feature: 10-creation-patch-bc-atp
    Scenario: 0301A1 - Login scenario management - How to connect in X3 using login type, user and password defined in the parameters file
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: Create patch Step 1
        # Call Function by code
        Given the user opens the "APATCH" function
        Then the "Patch creation" screen is displayed
       
        #Radio button field: selection of the radio button and control its states and the value selected
        Given the user selects the radio buttons group with name: "Destination type"
        When the user clicks on "Server" radio button of the selected radio buttons group
        #When the user clicks on "Client" radio button of the selected radio buttons group
        #Generate a dynamic value and assigned it to the spplier document no. field
        Given the user stores the generated value with length 6 with the key "ENV_NUMBER"
        
        #Text field: selection by name and enter a value followed by enter
        Given the user selects the text field with name: "File name"
        When the user writes "[PATCH]/SRC_BC_YATP_[ENV_NUMBER].dat" to the selected text field
        
        Given the user selects the data table of section: "Objects"


    Scenario Outline: Enter objects to patch

        #Data table: create a new line in the data table using cell column header
        #Data table: enter a value in the selected Text cell
        When the user selects last editable cell with column header: "Type"
        Then the user adds the text <Type> in selected cell

        When the user selects last editable cell with column header: "Object name"
        Then the user adds the text <Object name> in selected cell
        And the user hits enter

        Examples:
            | Type | Object name            |
            | "ACV"  | "YATP"               | 
            | "ARP"  | "YATP"               | 
            | "TRT"  | "YATPEXECARP"        | 
            | "TRT"  | "YCREATE_TEXT"       | 
            | "TRT"  | "YGET_CSV_FILE"      | 
            | "TRT"  | "YTRT_ARP_TRT_TST"   | 


            


    Scenario: Create patch Step final
        
        #Data table: select the main data table of the page
        Given the user selects the data table of section: "Activity codes"
        
        When the user selects last editable cell with column header: "Code"
        Then the user adds the text "YATP" in selected cell
        And the user hits enter

        #Then the user waits 10 seconds

         #Modal Dialog: click on the required action
        Then the user clicks the "OK" button in the header


    # ...
        #And the user clicks the Close page action icon on the header panel

    Scenario: 0302A2 - Logout scenario
        And the user logs-out from the system