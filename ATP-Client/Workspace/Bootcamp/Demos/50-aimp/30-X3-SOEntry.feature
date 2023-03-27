# ##############################################################################
# Script      : ATP_GESSOH_WOSOHALL
# Date        : 03/17/23 12:55:24
# Author      : Administrateur système (ADMIN)
# Comment     : Order management (Sales order)
# Version     : 2.9.05
# ##############################################################################

# #############################################################################
@SageX3AutomatedTestPlatform
# csv Flie --> this table
#
# | CSV_SOSITE     | CSV_SOCUST     | CSV_SODLVSITE   | CSV_LNITMREF | CSV_LNDSTOFCY | CSV_LNQTY |
# | "NA023"        | "NA010"        | "NA023"         | "FIN501"     | "NA023"       | "1"       |
# |                |                |                 | "FIN501"     | "NA023"       | "2"       |

 
Feature: FEATURE ATP_GESSOH_WOSOHALL
    # #############################################################################

    # #############################################################################
    Scenario: Connection
        # #############################################################################

        # Connection
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

        # Header

        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "CSV_SOSITE_1"
        Then the user extracts the value from the selected log panel line starting at 32 for 200 characters and stores it in key "CSV_SOSITE_1"
    
        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "CSV_SOCUST_1"
        Then the user extracts the value from the selected log panel line starting at 32 for 200 characters and stores it in key "CSV_SOCUST_1"

        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "CSV_SODLVSITE_1"
        Then the user extracts the value from the selected log panel line starting at 32 for 200 characters and stores it in key "CSV_SODLVSITE_1"


        # Lines

        # Line 1

        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "CSV_LNITMREF_1"
        Then the user extracts the value from the selected log panel line starting at 32 for 200 characters and stores it in key "CSV_LNITMREF_1"

        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "CSV_LNDSTOFCY_1"
        Then the user extracts the value from the selected log panel line starting at 32 for 200 characters and stores it in key "CSV_LNDSTOFCY_1"

        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "CSV_LNQTY_1"
        Then the user extracts the value from the selected log panel line starting at 32 for 200 characters and stores it in key "CSV_LNQTY_1"
        
        # Line 2

        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "CSV_LNITMREF_2"
        Then the user extracts the value from the selected log panel line starting at 32 for 200 characters and stores it in key "CSV_LNITMREF_2"

        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "CSV_LNDSTOFCY_2"
        Then the user extracts the value from the selected log panel line starting at 32 for 200 characters and stores it in key "CSV_LNDSTOFCY_2"

        #This step definition will allways select the 1st occurent of the text searched
        When the user selects the log panel line containing text "CSV_LNQTY_2"
        Then the user extracts the value from the selected log panel line starting at 32 for 200 characters and stores it in key "CSV_LNQTY_2"

        #Close the log
        And the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel

        Given the user opens the "GESSOH" function

        # Transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed

    # #############################################################################
    Scenario: Scenario Outline name: Creation Object Orders
        # #############################################################################

        # Button New
        When the user clicks the "New" main action button on the right panel
        And the user waits 1 seconds

        # Field : Sales site (Screen : SOH0 / SALFCY) (Data type : FCY Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Sales site"
        #When the user writes "csv:USV_SOSITE" to the selected text field
        When the user writes "[CSV_SOSITE_1]" to the selected text field
        # Field : Type (Screen : SOH0 / SOHTYP) (Data type : TSO Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Type"
        When the user writes "SON" to the selected text field
        Then the value of the selected text field is "SON"

        # Field : Date (Screen : SOH0 / ORDDAT) (Data type : D Date None ) (Options : 1) (Date Format : Dz:MM[-]DD[-]YY) (!! Mandatory field !!)
        Given the user selects the date field with name: "Date"
        When the user writes today to the selected date field
        Then the user hits tab

        And the user selects the text field with name: "Date"

        #Stored value: store the value of the selected text field
        Given the user stores the value of the selected text field with the key: "ENV_Date"


        #Generate two dynamic sequences of 5 and 6 digits and store the values
        And the user stores the generated value with length 5 with the key "ENV_SEQ"


        # Field : Reference (Screen : SOH0 / CUSORDREF) (Data type : A Alphanumeric None ) (Options : ) ()
        Given the user selects the text field with name: "Reference"
        #Stored value: write in the selected text field the value previously stored
        #When the user writes the stored text with key "ENV_Date" in the selected text field
        And the user writes "[ENV_Date]-[ENV_SEQ]" to the selected text field


        # Field : Sold-to (Screen : SOH0 / BPCORD) (Data type : BPC Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Sold-to"
        When the user writes "[CSV_SOCUST_1]" to the selected text field
        # #############################################################################

        And the user clicks the "Delivery" tab selected by title

        # Field : Shipment site (Screen : WK2ALL2 / STOFCY) (Data type : FCY Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Shipment site  "
        When the user writes "[CSV_SODLVSITE_1]" to the selected text field

        # #############################################################################

        And the user clicks the "Lines" tab selected by title

        #Then the user hits escape
        # Table : (Screen : WK2ALL4 / NBLIG) (Options : SKARID1)
        Given the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Lines


        When the user selects last fixed cell with header: "Product"
        #Then the user adds the text <LNITMREF> in selected cell
        Then the user adds the stored text with key <LNITMREF> in selected cell
        When the user selects last editable cell with column header: "Ship site"
        #Then the user adds the text <LNDSTOFCY> in selected cell
        Then the user adds the stored text with key <LNDSTOFCY> in selected cell
        When the user selects last editable cell with column header: "Ordered qty."
        #Then the user adds the text <LNQTY> in selected cell
        Then the user adds the stored text with key <LNQTY> in selected cell
        And the user hits enter


        Examples:
            | LNITMREF         | LNDSTOFCY           | LNQTY           |
            | "CSV_LNITMREF_1" | "CSV_LNDSTOFCY_1"   | "CSV_LNQTY_1"   |
            | "CSV_LNITMREF_2" | "CSV_LNDSTOFCY_2"   | "CSV_LNQTY_2"   |

    # #############################################################################
    Scenario: End Scenario Outline: Creation Object Orders
        # #############################################################################

        # Button Create
        When the user clicks the "Create" main action button on the right panel
        And the user waits 1 seconds

        Then a confirmation dialog appears with the message "Record has been created"

    # #############################################################################
    Scenario: Close page Order management (Sales order ALL : Full entry)
        # #############################################################################

        Then the user clicks the Close page action icon on the header panel

    # #############################################################################
    Scenario: Disconnection
        # #############################################################################

        # Disconnection
        And the user logs-out from the system


